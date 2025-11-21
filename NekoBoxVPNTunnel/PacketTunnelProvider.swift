import NetworkExtension

class PacketTunnelProvider: NEPacketTunnelProvider {
    private var engine: SingBoxEngine?

    override func startTunnel(options: [String: NSObject]? = nil) async throws {
        let url = AppGroup.sharedURL
        let config = try String(contentsOf: url)
        engine = SingBoxEngine()
        guard engine?.start(config) == true else {
            throw NSError(domain: "NekoBox", code: 1, userInfo: [NSLocalizedDescriptionKey: "sing-box start failed"])
        }

        let settings = NEPacketTunnelNetworkSettings(tunnelRemoteAddress: "127.0.0.1")
        settings.ipv4Settings = NEIPv4Settings(addresses: ["198.18.0.1"], subnetMasks: ["255.255.255.0"])
        settings.ipv4Settings?.includedRoutes = [NEIPv4Route.default()]
        settings.dnsSettings = NEDNSSettings(servers: ["8.8.8.8"])
        settings.mtu = 9000
        try await setTunnelNetworkSettings(settings)
    }

    override func stopTunnel(with reason: NEProviderStopReason) async {
        engine?.stop()
    }
}