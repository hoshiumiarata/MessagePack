import Foundation

class MessagePackNil : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xc0
    }
    
    static let shared = MessagePackNil()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        return Data(bytes: [signature])
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (nil, 1)
    }
}
