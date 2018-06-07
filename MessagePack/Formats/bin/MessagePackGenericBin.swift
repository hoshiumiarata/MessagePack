import Foundation

class MessagePackGenericBin : MessagePackFormat {
    override init() {
        super.init()
    }
    
    func createHeader(_ data: Data) -> Data { preconditionFailure() }
    func readHeader(_ data: Data) -> (binSize: Int, dataOffset: Int) { preconditionFailure() }
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        let data = object as! Data
        var res = createHeader(data)
        res.append(data)
        return res
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        let header = readHeader(data)
        
        return (data.subdata(in: header.dataOffset..<(header.dataOffset + header.binSize)), header.dataOffset + header.binSize)
    }
}
