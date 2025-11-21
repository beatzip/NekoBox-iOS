import NetworkExtension
import Foundation

@MainActor
final class VPNManager: ObservableObject {
    @Published var status: NEVPNStatus = .disconnected

    private var manager = NETunnelProviderManager()

    init() {
        loadManager()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(statusDidChange),
            name: .NEVPNStatusDidChange,
            object: nil
        )
    }

    private func loadManager() {
        NETunnelProviderManager.loadAllFromPreferences { [weak self] managers, _ in
            self?.manager = managers?.first ?? NETunnelProviderManager()
            self?.status = self?.manager.connection.status ?? .disconnected
        }
    }

    @objc private func statusDidChange() {
        status = manager.connection.status
    }

    func toggleVPN() {
        switch status {
        case .disconnected:
            startVPN()
        case .connected, .connecting:
            stopVPN()
        default:
            break
        }
    }

    private func startVPN() {
        let proto = NETunnelProviderProtocol()
        proto.providerBundleIdentifier = "com.neko.nb4a.vpn"
        proto.serverAddress = "127.0.0.1"

        manager.protocolConfiguration = proto
        manager.localizedDescription = "NekoBox VPN"
        manager.isEnabled = true

        manager.saveToPreferences { [weak self] _ in
            self?.manager.loadFromPreferences { _ in
                do {
                    try self?.manager.connection.startVPNTunnel()
                } catch {
                    NB4ALogger.error("start error: \(error)")
                }
            }
        }
    }

    private func stopVPN() {
        manager.connection.stopVPNTunnel()
    }
}