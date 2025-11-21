import Foundation

final class SingBoxEngine {
    private var handle: SingBox?

    func start(_ json: String) -> Bool {
        handle = SingBox()
        return handle?.start(json) ?? false
    }

    func stop() {
        handle?.stop()
        handle = nil
    }
}
