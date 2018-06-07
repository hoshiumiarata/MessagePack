@testable import MessagePack
import XCTest

class MessagePackMapTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpackingFixMap() {
        let testData: [AnyHashable: Any?] = [UInt8(125): UInt8(1), true: [UInt8(2), false], UInt8(3): false]
        let data = try? MessagePackFixMap.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackFixMap.shared.checkSignature(data!))
        let unpacked = try? MessagePackFixMap.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 9)
        let unpackedMap = unpacked!.object as! [AnyHashable: Any?]
        XCTAssertEqual(unpackedMap.count, testData.count)
        XCTAssertEqual((unpackedMap[true] as! [Any?]).count, 2)
    }
    
    func testPackingAndUnpackingMap16() {
        let testData: [AnyHashable: Any?] = [UInt8(125): UInt8(1), true: [UInt8(2), false], UInt8(3): false]
        let data = try? MessagePackMap16.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackMap16.shared.checkSignature(data!))
        let unpacked = try? MessagePackMap16.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 11)
        let unpackedMap = unpacked!.object as! [AnyHashable: Any?]
        XCTAssertEqual(unpackedMap.count, testData.count)
        XCTAssertEqual((unpackedMap[true] as! [Any?]).count, 2)
    }
    
    func testPackingAndUnpackingFixMap32() {
        let testData: [AnyHashable: Any?] = [UInt8(125): UInt8(1), true: [UInt8(2), false], UInt8(3): false]
        let data = try? MessagePackMap32.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackMap32.shared.checkSignature(data!))
        let unpacked = try? MessagePackMap32.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 13)
        let unpackedMap = unpacked!.object as! [AnyHashable: Any?]
        XCTAssertEqual(unpackedMap.count, testData.count)
        XCTAssertEqual((unpackedMap[true] as! [Any?]).count, 2)
    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackFixMap.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
