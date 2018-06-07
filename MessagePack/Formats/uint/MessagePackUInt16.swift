import Foundation

class MessagePackUInt16 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xcd
    }
    
    static let shared = MessagePackUInt16()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt16(&result, object as! UInt16)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (MessagePackDataHelpers.getUInt16(data, 1), 3)
    }
}
