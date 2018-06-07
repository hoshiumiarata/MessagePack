import Foundation

class MessagePackFixMap : MessagePackGenericMap {
    override init() {
        super.init()
        signature = 0b10000000
    }
    
    static let shared = MessagePackFixMap()
    
    override func checkSignature(_ dataSignature: UInt8) -> Bool {
        return (dataSignature & 0b11110000) == signature
    }
    
    override func createHeader(_ map: [AnyHashable: MessagePackable?]) -> Data {
        return Data([signature | UInt8(map.count)])
    }
    
    override func readHeader(_ data: Data) -> (mapSize: Int, dataOffset: Int) {
        return (Int(data[0] & 0b00001111), 1)
    }
}
