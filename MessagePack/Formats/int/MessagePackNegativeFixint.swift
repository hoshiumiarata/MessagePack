import Foundation

class MessagePackNegativeFixint : MessagePackFormat {
    override init() {
        super.init()
        signature = 0b11100000
    }
    
    static let shared = MessagePackNegativeFixint()
    
    override func checkSignature(_ dataSignature: UInt8) -> Bool {
        return (dataSignature & signature) == signature
    }
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        return Data(bytes: [UInt8(bitPattern: object as! Int8)])
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        return (Int8(bitPattern: data[0]), 1)
    }
}
