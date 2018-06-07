import Foundation

class MessagePackInt8 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xd0
    }
    
    static let shared = MessagePackInt8()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        return Data(bytes: [signature, UInt8(bitPattern: object as! Int8)])
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (Int8(bitPattern: data[1]), 2)
    }
}
