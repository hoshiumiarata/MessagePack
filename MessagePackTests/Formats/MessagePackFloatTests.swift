@testable import MessagePack
import XCTest

class MessagePackFloatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpackingFloat32() {
        let data = try? MessagePackFloat32.shared.pack(Float32(3000.1))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackFloat32.shared.checkSignature(data!))
        let unpacked = try! MessagePackFloat32.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 5)
        XCTAssertEqual(unpacked.object as? Float32, Float32(3000.1))
    }
    
    func testPackingAndUnpackingFloat64() {
        let data = try? MessagePackFloat64.shared.pack(Float64(-101.1))
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackFloat64.shared.checkSignature(data!))
        let unpacked = try! MessagePackFloat64.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 9)
        XCTAssertEqual(unpacked.object as? Float64, Float64(-101.1))
    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackFloat32.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackFloat64.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
