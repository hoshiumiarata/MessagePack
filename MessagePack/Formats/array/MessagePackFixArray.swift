import Foundation

class MessagePackFixArray : MessagePackGenericArray {
    override init() {
        super.init()
        signature = 0b10010000
    }
    
    static let shared = MessagePackFixArray()
    
    override func checkSignature(_ dataSignature: UInt8) -> Bool {
        return (dataSignature & 0b11110000) == signature
    }
    
    override func createHeader(_ array: [MessagePackable?]) -> Data {
        return Data([signature | UInt8(array.count)])
    }
    
    override func readHeader(_ data: Data) -> (arraySize: Int, dataOffset: Int) {
        return (Int(data[0] & 0b00001111), 1)
    }
}
