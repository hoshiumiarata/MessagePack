import Foundation

class MessagePackInt16 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xd1
    }
    
    static let shared = MessagePackInt16()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.append(&result, (object as! Int16).bigEndian)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        var result = Int16()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: 1..<3)
        return (Int16(bigEndian: result), 3)
    }
}
