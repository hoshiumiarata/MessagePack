import Foundation

class MessagePackGenericMap : MessagePackFormat {
    override init() {
        super.init()
    }
    
    func createHeader(_ map: [AnyHashable: MessagePackable?]) -> Data { preconditionFailure() }
    func readHeader(_ data: Data) -> (mapSize: Int, dataOffset: Int) { preconditionFailure() }
    
    override func pack(_ object: MessagePackable?) throws -> Data {
        let map = object as! [AnyHashable: MessagePackable?]
        var res = createHeader(map)
        for (k, v) in map {
            res.append(try MessagePack.shared.pack(k as? MessagePackable))
            res.append(try MessagePack.shared.pack(v))
        }
        return res
    }
    
    override func unpack(_ data: Data) throws -> (object: MessagePackable?, byteCount: Int) {
        let header = readHeader(data)
        let mapSize = header.mapSize
        var result: [AnyHashable: MessagePackable?] = [:]
        var byteCount = header.dataOffset
        for _ in 0..<mapSize {
            var subdata = data.subdata(in: byteCount..<data.count)
            let key = try MessagePack.shared.unpack(subdata)
            byteCount += key.byteCount
            subdata = data.subdata(in: byteCount..<data.count)
            let value = try MessagePack.shared.unpack(subdata)
            byteCount += value.byteCount
            result[key.object as! AnyHashable] = value.object
        }
        return (result, byteCount)
    }
}
