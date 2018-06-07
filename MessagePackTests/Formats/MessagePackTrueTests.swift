@testable import MessagePack
import XCTest

class MessagePackTrueTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpacking() {
        let data = try? MessagePackTrue.shared.pack(true)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackTrue.shared.checkSignature(data!))
        let unpacked = try! MessagePackTrue.shared.unpack(data!)
        XCTAssertEqual(unpacked.byteCount, 1)
        XCTAssertEqual(unpacked.object as? Bool, true)

    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackTrue.shared.checkSignature(Data()))
    }

    func testPerformanceExample() {
        self.measure {
        }
    }

}
