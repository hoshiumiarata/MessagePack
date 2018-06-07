@testable import MessagePack
import XCTest

class MessagePackArrayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpackingFixArray() {
        let testData: [Any?] = [UInt8(125), nil, [UInt32(100000000)], false, [UInt8(200), nil], true]
        let data = try? MessagePackFixArray.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackFixArray.shared.checkSignature(data!))
        let unpacked = try? MessagePackFixArray.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 15)
        let unpackedArray = unpacked!.object as! [Any?]
        XCTAssertEqual(unpackedArray.count, testData.count)
        XCTAssertEqual((unpackedArray[4] as! [Any?]).count, 2)
    }
    
    func testPackingAndUnpackingArray16() {
        let testData: [Any?] = [UInt8(125), nil, [UInt32(100000000)], false, [UInt8(200), nil], true]
        let data = try? MessagePackArray16.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackArray16.shared.checkSignature(data!))
        let unpacked = try? MessagePackArray16.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 17)
        let unpackedArray = unpacked!.object as! [Any?]
        XCTAssertEqual(unpackedArray.count, testData.count)
        XCTAssertEqual((unpackedArray[4] as! [Any?]).count, 2)
    }
    
    func testPackingAndUnpackingArray32() {
        let testData: [Any?] = [UInt8(125), nil, [UInt32(100000000)], false, [UInt8(200), nil], true]
        let data = try? MessagePackArray32.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackArray32.shared.checkSignature(data!))
        let unpacked = try? MessagePackArray32.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 19)
        let unpackedArray = unpacked!.object as! [Any?]
        XCTAssertEqual(unpackedArray.count, testData.count)
        XCTAssertEqual((unpackedArray[4] as! [Any?]).count, 2)
    }
    
    func testFixArrayUnpackingBadData() {
        XCTAssertFalse(MessagePackFixArray.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackArray16.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackArray32.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
