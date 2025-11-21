import Foundation

struct AppGroup {
    static let id = "group.com.neko.nb4a.config"
    static var sharedURL: URL {
        FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: id)!
            .appendingPathComponent("config.json")
    }
}