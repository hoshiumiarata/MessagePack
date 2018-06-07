import Foundation

class MessagePackString16 : MessagePackGenericString {
    override init() {
        super.init()
        signature = 0xda
    }
    
    static let shared = MessagePackString16()
    
    override func createHeader(_ string: Data) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt16(&result, UInt16(string.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (stringSize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt16(data, 1)), 3)
    }
}
