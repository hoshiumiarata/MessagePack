import Foundation

class MessagePackArray16 : MessagePackGenericArray {
    override init() {
        super.init()
        signature = 0xdc
    }
    
    static let shared = MessagePackArray16()
    
    override func createHeader(_ array: [MessagePackable?]) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt16(&result, UInt16(array.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (arraySize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt16(data, 1)), 3)
    }
}
