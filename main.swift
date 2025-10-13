import Foundation

let rule = NB4ARouteRule(
    inbound: ["mixed-in"],
    outbound: "direct",
    domain: ["geosite:cn"]
)

let config = NB4ARouteConfig(rules: [rule])
let manager = ConfigManager.shared

do {
    let path = FileManager.default.currentDirectoryPath + "/Resources/config.json"
    let url = URL(fileURLWithPath: path)
    try manager.saveRouteConfig(config, to: url)
    _ = try manager.loadRouteConfig(from: url)
    NB4ALogger.info("Demo route config saved & loaded successfully.")
} catch {
    NB4ALogger.error("Failed: \(error.localizedDescription)")
}