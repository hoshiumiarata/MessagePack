import Foundation

class MessagePackMap16 : MessagePackGenericMap {
    override init() {
        super.init()
        signature = 0xde
    }
    
    static let shared = MessagePackMap16()
    
    override func createHeader(_ map: [AnyHashable: MessagePackable?]) -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.appendUInt16(&result, UInt16(map.count))
        return result
    }
    
    override func readHeader(_ data: Data) -> (mapSize: Int, dataOffset: Int) {
        return (Int(MessagePackDataHelpers.getUInt16(data, 1)), 3)
    }
}
