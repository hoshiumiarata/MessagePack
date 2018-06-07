@testable import MessagePack
import XCTest

class MessagePackUIntTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpackingPositiveFixint() {
        let data = try? MessagePackPositiveFixint.shared.pack(UInt8(125))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackPositiveFixint.shared.checkSignature(data!))
        let unpacked = try! MessagePackPositiveFixint.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 1)
        XCTAssertEqual(unpacked.object as? UInt8, UInt8(125))
    }
    
    func testPackingAndUnpackingUInt8() {
        let data = try? MessagePackUInt8.shared.pack(UInt8(200))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackUInt8.shared.checkSignature(data!))
        let unpacked = try! MessagePackUInt8.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 2)
        XCTAssertEqual(unpacked.object as? UInt8, UInt8(200))
    }
    
    func testPackingAndUnpackingUInt16() {
        let data = try? MessagePackUInt16.shared.pack(UInt16(3000))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackUInt16.shared.checkSignature(data!))
        let unpacked = try! MessagePackUInt16.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 3)
        XCTAssertEqual(unpacked.object as? UInt16, UInt16(3000))
    }
    
    func testPackingAndUnpackingUInt32() {
        let data = try? MessagePackUInt32.shared.pack(UInt32(3000))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackUInt32.shared.checkSignature(data!))
        let unpacked = try! MessagePackUInt32.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 5)
        XCTAssertEqual(unpacked.object as? UInt32, UInt32(3000))
    }
    
    func testPackingAndUnpackingUInt64() {
        let data = try? MessagePackUInt64.shared.pack(UInt64(3000))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackUInt64.shared.checkSignature(data!))
        let unpacked = try! MessagePackUInt64.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 9)
        XCTAssertEqual(unpacked.object as? UInt64, UInt64(3000))
    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackPositiveFixint.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackUInt8.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackUInt16.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackUInt32.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackUInt64.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
