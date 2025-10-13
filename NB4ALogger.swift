import os

public enum NB4ALogger {
    private static let subsystem = "com.neko.nb4a"

    private static let general = Logger(subsystem: subsystem, category: "general")
    private static let network = Logger(subsystem: subsystem, category: "network")
    private static let config = Logger(subsystem: subsystem, category: "config")

    public static func info(_ message: String) {
        general.info("\(message, privacy: .public)")
    }

    public static func networkInfo(_ message: String) {
        network.info("\(message, privacy: .public)")
    }

    public static func configInfo(_ message: String) {
        config.info("\(message, privacy: .public)")
    }

    public static func error(_ message: String) {
        general.error("\(message, privacy: .public)")
    }

    public static func debug(_ message: String) {
        general.debug("\(message, privacy: .public)")
    }
}