import Foundation

class MessagePackTrue : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xc3
    }
    
    static let shared = MessagePackTrue()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        return Data(bytes: [signature])
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (true, 1)
    }
}
