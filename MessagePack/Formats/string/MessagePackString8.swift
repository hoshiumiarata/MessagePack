import Foundation

class MessagePackString8 : MessagePackGenericString {
    override init() {
        super.init()
        signature = 0xd9
    }
    
    static let shared = MessagePackString8()
    
    override func createHeader(_ string: Data) -> Data {
        return Data([signature, UInt8(string.count)])
    }
    
    override func readHeader(_ data: Data) -> (stringSize: Int, dataOffset: Int) {
        return (Int(data[1]), 2)
    }
}
