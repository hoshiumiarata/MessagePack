import Foundation

class MessagePackFixString : MessagePackGenericString {
    override init() {
        super.init()
        signature = 0b10100000
    }
    
    static let shared = MessagePackFixString()
    
    override func checkSignature(_ dataSignature: UInt8) -> Bool {
        return (dataSignature & 0b11100000) == signature
    }
    
    override func createHeader(_ string: Data) -> Data {
        return Data([signature | UInt8(string.count)])
    }
    
    override func readHeader(_ data: Data) -> (stringSize: Int, dataOffset: Int) {
        return (Int(data[0] & 0b00011111), 1)
    }
}
