@testable import MessagePack
import XCTest

class MessagePackIntTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpackingNegativeFixint() {
        let data = try? MessagePackNegativeFixint.shared.pack(Int8(-32))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackNegativeFixint.shared.checkSignature(data!))
        let unpacked = try! MessagePackNegativeFixint.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 1)
        XCTAssertEqual(unpacked.object as? Int8, Int8(-32))
    }
    
    func testPackingAndUnpackingInt8() {
        let data = try? MessagePackInt8.shared.pack(Int8(-100))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackInt8.shared.checkSignature(data!))
        let unpacked = try! MessagePackInt8.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 2)
        XCTAssertEqual(unpacked.object as? Int8, Int8(-100))
    }
    
    func testPackingAndUnpackingInt16() {
        let data = try? MessagePackInt16.shared.pack(Int16(-3000))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackInt16.shared.checkSignature(data!))
        let unpacked = try! MessagePackInt16.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 3)
        XCTAssertEqual(unpacked.object as? Int16, Int16(-3000))
    }
    
    func testPackingAndUnpackingInt32() {
        let data = try? MessagePackInt32.shared.pack(Int32(-3000))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackInt32.shared.checkSignature(data!))
        let unpacked = try! MessagePackInt32.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 5)
        XCTAssertEqual(unpacked.object as? Int32, Int32(-3000))
    }
    
    func testPackingAndUnpackingInt64() {
        let data = try? MessagePackInt64.shared.pack(Int64(-3000))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackInt64.shared.checkSignature(data!))
        let unpacked = try! MessagePackInt64.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 9)
        XCTAssertEqual(unpacked.object as? Int64, Int64(-3000))
    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackNegativeFixint.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackInt8.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackInt16.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackInt32.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackInt64.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
