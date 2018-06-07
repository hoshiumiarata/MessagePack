import Foundation

class MessagePackInt32 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xd2
    }
    
    static let shared = MessagePackInt32()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.append(&result, (object as! Int32).bigEndian)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        var result = Int32()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: 1..<5)
        return (Int32(bigEndian: result), 5)
    }
}
