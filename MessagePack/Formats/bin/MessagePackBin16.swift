import Foundation

class MessagePackBin16 : MessagePackGenericBin {
    override init() {
        super.init()
        signature = 0xc5
    }
    
    static let shared = MessagePackBin16()
    
    override func createHeader(_ data: Data) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt16(&result, UInt16(data.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (binSize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt16(data, 1)), 3)
    }
}
