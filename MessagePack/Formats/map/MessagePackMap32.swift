import Foundation

class MessagePackMap32 : MessagePackGenericMap {
    override init() {
        super.init()
        signature = 0xdf
    }
    
    static let shared = MessagePackMap32()
    
    override func createHeader(_ map: [AnyHashable: MessagePackable?]) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt32(&result, UInt32(map.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (mapSize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt32(data, 1)), 5)
    }
}
