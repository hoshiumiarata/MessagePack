import Foundation

class MessagePackGenericArray : MessagePackFormat {
    override init() {
        super.init()
    }
    
    func createHeader(_ array: [MessagePackable?]) -> Data { preconditionFailure() }
    func readHeader(_ data: Data) -> (arraySize: Int, dataOffset: Int) { preconditionFailure() }
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        let array = object as! [MessagePackable?]
        var res = createHeader(array)
        for o in array {
            res.append(try MessagePack.shared.pack(o))
        }
        return res
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        let header = readHeader(data)
        let arraySize = header.arraySize
        var result: [MessagePackable?] = []
        var byteCount = header.dataOffset
        for _ in 0..<arraySize {
            let subdata = data.subdata(in: byteCount..<data.count)
            let element = try MessagePack.shared.unpack(subdata)
            result.append(element.object)
            byteCount += element.byteCount
        }
        return (result, byteCount)
    }
}
