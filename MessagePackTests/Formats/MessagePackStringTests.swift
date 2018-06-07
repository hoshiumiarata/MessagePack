@testable import MessagePack
import XCTest

class MessagePackStringTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpackingFixString() {
        let testData = "testString"
        let data = try? MessagePackFixString.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackFixString.shared.checkSignature(data!))
        let unpacked = try? MessagePackFixString.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        let unpackedString = unpacked!.object as! String
        XCTAssertEqual(unpackedString, testData)
    }
    
    func testPackingAndUnpackingString8() {
        let testData = "testString"
        let data = try? MessagePackString8.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackString8.shared.checkSignature(data!))
        let unpacked = try? MessagePackString8.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        let unpackedString = unpacked!.object as! String
        XCTAssertEqual(unpackedString, testData)
    }
    
    func testPackingAndUnpackingString16() {
        let testData = "testString"
        let data = try? MessagePackString16.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackString16.shared.checkSignature(data!))
        let unpacked = try? MessagePackString16.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        let unpackedString = unpacked!.object as! String
        XCTAssertEqual(unpackedString, testData)
    }
    
    func testPackingAndUnpackingString32() {
        let testData = "testString"
        let data = try? MessagePackString32.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackString32.shared.checkSignature(data!))
        let unpacked = try? MessagePackString32.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        let unpackedString = unpacked!.object as! String
        XCTAssertEqual(unpackedString, testData)
    }
    
    func testUnpackingBadData() {
        XCTAssertFalse(MessagePackFixString.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
}
