import Foundation

class MessagePackFloat32 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xca
    }
    
    static let shared = MessagePackFloat32()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.append(&result, (object as! Float32).bitPattern.bigEndian)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        var result = UInt32()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: 1..<5)
        return (Float32(bitPattern: UInt32(bigEndian: result)), 5)
    }
}
