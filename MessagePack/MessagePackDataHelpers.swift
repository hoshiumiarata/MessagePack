import Foundation

class MessagePackDataHelpers {
    static func append<T>(_ data: inout Data, _ value: T) {
        var temp = value
        data.append(UnsafeBufferPointer(start: &temp, count: 1))
    }
    
    static func appendUInt16(_ data: inout Data, _ value: UInt16) {
        append(&data, value.bigEndian)
    }
    
    static func appendUInt32(_ data: inout Data, _ value: UInt32) {
        append(&data, value.bigEndian)
    }
    
    static func appendUInt64(_ data: inout Data, _ value: UInt64) {
        append(&data, value.bigEndian)
    }
    
    static func getUInt16(_ data: Data, _ index: Int) -> UInt16 {
        var result = UInt16()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: index..<(index + 2))
        return UInt16(bigEndian: result)
    }
    
    static func getUInt32(_ data: Data, _ index: Int) -> UInt32 {
        var result = UInt32()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: index..<(index + 4))
        return UInt32(bigEndian: result)
    }
    
    static func getUInt64(_ data: Data, _ index: Int) -> UInt64 {
        var result = UInt64()
        let _ = data.copyBytes(to: UnsafeMutableBufferPointer(start: &result, count: 1), from: index..<(index + 8))
        return UInt64(bigEndian: result)
    }
}
