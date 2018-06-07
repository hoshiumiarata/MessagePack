import Foundation

class MessagePackString32 : MessagePackGenericString {
    override init() {
        super.init()
        signature = 0xdb
    }
    
    static let shared = MessagePackString32()
    
    override func createHeader(_ string: Data) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt32(&result, UInt32(string.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (stringSize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt32(data, 1)), 5)
    }
}
