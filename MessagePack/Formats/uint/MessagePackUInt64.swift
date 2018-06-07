import Foundation

class MessagePackUInt64 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xcf
    }
    
    static let shared = MessagePackUInt64()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt64(&result, object as! UInt64)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (MessagePackDataHelpers.getUInt64(data, 1), 9)
    }
}
