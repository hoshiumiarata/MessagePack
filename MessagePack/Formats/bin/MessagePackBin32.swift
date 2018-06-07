import Foundation

class MessagePackBin32 : MessagePackGenericBin {
    override init() {
        super.init()
        signature = 0xc6
    }
    
    static let shared = MessagePackBin32()
    
    override func createHeader(_ data: Data) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt32(&result, UInt32(data.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (binSize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt32(data, 1)), 5)
    }
}
