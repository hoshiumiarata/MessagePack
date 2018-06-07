import Foundation

class MessagePackUInt32 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xce
    }
    
    static let shared = MessagePackUInt32()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt32(&result, object as! UInt32)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (MessagePackDataHelpers.getUInt32(data, 1), 5)
    }
}
