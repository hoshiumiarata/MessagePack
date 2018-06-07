import Foundation

class MessagePackArray32 : MessagePackGenericArray {
    override init() {
        super.init()
        signature = 0xdd
    }
    
    static let shared = MessagePackArray32()
    
    override func createHeader(_ array: [MessagePackable?]) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt32(&result, UInt32(array.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (arraySize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt32(data, 1)), 5)
    }
}
