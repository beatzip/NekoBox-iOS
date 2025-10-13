mport Foundation

/// MARK: - NB4A Route Configuration Model
public struct NB4ARouteRule: Codable {
    public var inbound: [String]
    public var outbound: String
    public var domain: [String]?
    public var dstPort: String?
    public var srcPort: String?
    public var dstIP: [String]?
    public var srcIP: [String]?
    public var protocolType: [String]?
    public var processName: [String]?
    public var network: [String]?
    public var outboundFallback: String?

    public init(
        inbound: [String],
        outbound: String,
        domain: [String]? = nil,
        dstPort: String? = nil,
        srcPort: String? = nil,
        dstIP: [String]? = nil,
        srcIP: [String]? = nil,
        protocolType: [String]? = nil,
        processName: [String]? = nil,
        network: [String]? = nil,
        outboundFallback: String? = nil
    ) {
        self.inbound = inbound
        self.outbound = outbound
        self.domain = domain
        self.dstPort = dstPort
        self.srcPort = srcPort
        self.dstIP = dstIP
        self.srcIP = srcIP
        self.protocolType = protocolType
        self.processName = processName
        self.network = network
        self.outboundFallback = outboundFallback
    }
}

/// MARK: - Full Route Configuration
public struct NB4ARouteConfig: Codable {
    public var rules: [NB4ARouteRule]
    public var dnsRoutingEnabled: Bool
    public var localDNS: String
    public var remoteDNS: String

    public init(
        rules: [NB4ARouteRule],
        dnsRoutingEnabled: Bool = true,
        localDNS: String = "223.5.5.5",
        remoteDNS: String = "8.8.8.8"
    ) {
        self.rules = rules
        self.dnsRoutingEnabled = dnsRoutingEnabled
        self.localDNS = localDNS
        self.remoteDNS = remoteDNS
    }
}