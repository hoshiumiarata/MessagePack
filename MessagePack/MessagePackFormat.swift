import Foundation

public class MessagePackFormat {
    var signature: UInt8 = 0x0
    
    func checkSignature(_ dataSignature: UInt8) -> Bool {
        return dataSignature == signature
    }
    
    static func extractSignature(fromData data: Data) -> UInt8 {
        return data[0]
    }
    
    func checkSignature(_ data: Data) -> Bool {
        if data.count == 0 {
            return false
        }
        return checkSignature(MessagePackFormat.extractSignature(fromData: data))
    }
    
    func pack(_ object: MessagePackable?) throws -> Data { preconditionFailure() }
    func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) { preconditionFailure() }
}
