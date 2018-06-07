import Foundation

class MessagePackFloat64 : MessagePackFormat {
    override init() {
        super.init()
        signature = 0xcb
    }
    
    static let shared = MessagePackFloat64()
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        var result = Data(bytes: [signature])
        MessagePackDataHelpers.append(&result, (object as! Float64).bitPattern.bigEndian)
        return result
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        var result = UInt64()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: 1..<9)
        return (Float64(bitPattern: UInt64(bigEndian: result)), 9)
    }
}
