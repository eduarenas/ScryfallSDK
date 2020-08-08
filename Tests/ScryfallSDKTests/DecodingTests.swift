//
//  DecodingTests.swift
//  
//
//  Created by Eduardo Arenas on 8/8/20.
//

import XCTest
@testable import ScryfallSDK

/// This teset suite tests decoding for a large data set located in `Tests/ScryfallSDKTests/Data`. In order to run the tests
/// the data has to be decompressed first. This can be done running the script `Scripts/decompress_test_data.sh` once.
final class DecodingTests: XCTestCase {

    func testCardsDecode() throws {
        let testFilePath = #file
        let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/all_cards.json")
        let testData = try Data(contentsOf: testDataFilePath)
        XCTAssertNoThrow(try JSONDecoder.scryfallDecoder.decode([Card].self, from: testData))
        // TODO: Look for always `nil` optional fields, thise might be silently failing to decode
    }

    func testRulingsDecode() throws {
        let testFilePath = #file
        let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/rulings.json")
        let testData = try Data(contentsOf: testDataFilePath)
        XCTAssertNoThrow(try JSONDecoder.scryfallDecoder.decode([Ruling].self, from: testData))
    }

    static var allTests = [
        ("testCardsDecode", testCardsDecode),
    ]
}
