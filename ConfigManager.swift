import Foundation

public final class ConfigManager {
    public static let shared = ConfigManager()

    private init() {}

    public func saveRouteConfig(_ config: NB4ARouteConfig, to url: URL) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(config)
        try data.write(to: url)
        NB4ALogger.configInfo("Saved route config to \(url.path)")
    }

    public func loadRouteConfig(from url: URL) throws -> NB4ARouteConfig {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let config = try decoder.decode(NB4ARouteConfig.self, from: data)
        NB4ALogger.configInfo("Loaded route config from \(url.path)")
        return config
    }
}