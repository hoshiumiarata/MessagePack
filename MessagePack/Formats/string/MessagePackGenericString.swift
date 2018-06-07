import Foundation

class MessagePackGenericString : MessagePackFormat {
    override init() {
        super.init()
    }
    
    func createHeader(_ string: Data) -> Data { preconditionFailure() }
    func readHeader(_ data: Data) -> (stringSize: Int, dataOffset: Int) { preconditionFailure() }
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        let string = (object as! String).data(using: .utf8)!
        var res = createHeader(string)
        res.append(string)
        return res
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        let header = readHeader(data)
        let result = String(data: data.subdata(in: header.dataOffset..<(header.dataOffset + header.stringSize)), encoding: .utf8)
        
        return (result, header.dataOffset + header.stringSize)
    }
}
