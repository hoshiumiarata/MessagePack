import Foundation

class MessagePackPositiveFixint : MessagePackFormat {
    override init() {
        super.init()
        signature = 0x0
    }
    
    static let shared = MessagePackPositiveFixint()
    
    override func checkSignature(_ dataSignature: UInt8) -> Bool {
        return (dataSignature & 0b10000000) == 0
    }
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        return Data(bytes: [object as! UInt8])
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (data[0], 1)
    }
}
