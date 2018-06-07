@testable import MessagePack
import XCTest

class MessagePackNilTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPackingAndUnpacking() {
        let data = try? MessagePackNil.shared.pack(nil)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackNil.shared.checkSignature(data!))
        let unpacked = try! MessagePackNil.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 1)
        XCTAssertNil(unpacked.object)

    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackNil.shared.checkSignature(Data()))
    }

    func testPerformanceExample() {
        self.measure {
        }
    }

}
