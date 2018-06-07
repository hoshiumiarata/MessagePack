import Foundation

public class MessagePack {
    private let formats = [
        MessagePackNil.shared,
        MessagePackTrue.shared,
        MessagePackFalse.shared,
        MessagePackPositiveFixint.shared,
        MessagePackUInt8.shared,
        MessagePackUInt16.shared,
        MessagePackUInt32.shared,
        MessagePackUInt64.shared,
        MessagePackInt8.shared,
        MessagePackInt16.shared,
        MessagePackInt32.shared,
        MessagePackInt64.shared,
        MessagePackFloat32.shared,
        MessagePackFloat64.shared,
        MessagePackNegativeFixint.shared,
        MessagePackFixArray.shared,
        MessagePackArray16.shared,
        MessagePackArray32.shared,
        MessagePackFixMap.shared,
        MessagePackMap16.shared,
        MessagePackMap32.shared,
        MessagePackFixString.shared,
        MessagePackString8.shared,
        MessagePackString16.shared,
        MessagePackString32.shared,
        MessagePackBin8.shared,
        MessagePackBin16.shared,
        MessagePackBin32.shared
    ]
    
    public static let shared = MessagePack()
    
    public func pack(_ object: MessagePackable?) throws -> Data {
        let format = object != nil ? object!.messagePackFormat : MessagePackNil.shared
        return try format.pack(object)
    }
    
    public func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        let signature = MessagePackFormat.extractSignature(fromData: data)
        for format in formats {
            if format.checkSignature(signature) {
                return try format.unpack(data)
            }
        }
        throw MessagePackError.unknownSignature
    }
}
