@testable import MessagePack
import XCTest

class MessagePackFalseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpacking() {
        let data = try? MessagePackFalse.shared.pack(false)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackFalse.shared.checkSignature(data!))
        let unpacked = try! MessagePackFalse.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 1)
        XCTAssertEqual(unpacked.object as? Bool, false)
    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackFalse.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
