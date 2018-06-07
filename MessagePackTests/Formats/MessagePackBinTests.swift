@testable import MessagePack
import XCTest

class MessagePackBinTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPackingAndUnpackingBin8() {
        let testData = Data([1, 2, 3])
        let data = try? MessagePackBin8.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackBin8.shared.checkSignature(data!))
        let unpacked = try? MessagePackBin8.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 5)
        let unpackedBin = unpacked!.object as! Data
        XCTAssertEqual(unpackedBin.count, testData.count)
    }
    
    func testPackingAndUnpackingBin16() {
        let testData = Data([1, 2, 3])
        let data = try? MessagePackBin16.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackBin16.shared.checkSignature(data!))
        let unpacked = try? MessagePackBin16.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 6)
        let unpackedBin = unpacked!.object as! Data
        XCTAssertEqual(unpackedBin.count, testData.count)
    }
    
    func testPackingAndUnpackingBin32() {
        let testData = Data([1, 2, 3])
        let data = try? MessagePackBin32.shared.pack(testData)
        XCTAssertNotNil(data)
        XCTAssertTrue(MessagePackBin32.shared.checkSignature(data!))
        let unpacked = try? MessagePackBin32.shared.unpack(data!)
        XCTAssertNotNil(unpacked)
        XCTAssertEqual(unpacked!.byteCount, 8)
        let unpackedBin = unpacked!.object as! Data
        XCTAssertEqual(unpackedBin.count, testData.count)
    }
    
    func testFixArrayUnpackingBadData() {
        XCTAssertFalse(MessagePackBin8.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackBin16.shared.checkSignature(Data()))
        XCTAssertFalse(MessagePackBin32.shared.checkSignature(Data()))
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
