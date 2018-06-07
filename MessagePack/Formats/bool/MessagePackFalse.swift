import Foundation

class MessagePackFalse : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xc2
    }
    
    static let shared = MessagePackFalse()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        return Data(bytes: [signature])
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (false, 1)
    }
}
