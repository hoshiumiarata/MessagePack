import Foundation

class MessagePackBin8 : MessagePackGenericBin {
    override init() {
        super.init()
        signature = 0xc4
    }
    
    static let shared = MessagePackBin8()
    
    override func createHeader(_ data: Data) -> Data {
        return Data([signature, UInt8(data.count)])
    }
    
    override func readHeader(_ data: Data) -> (binSize: Int, dataOffset: Int) {
        return (Int(data[1]), 2)
    }
}
