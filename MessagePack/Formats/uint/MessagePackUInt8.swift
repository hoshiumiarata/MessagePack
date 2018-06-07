import Foundation

class MessagePackUInt8 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xcc
    }
    
    static let shared = MessagePackUInt8()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        return Data(bytes: [signature, object as! UInt8])
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (data[1], 2)
    }
}
