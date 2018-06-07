import Foundation

class MessagePackInt64 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xd3
    }
    
    static let shared = MessagePackInt64()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.append(&result, (object as! Int64).bigEndian)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        var result = Int64()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: 1..<9)
        return (Int64(bigEndian: result), 9)
    }
}
