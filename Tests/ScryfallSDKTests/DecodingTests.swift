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

    func testListDecode() throws {
        let testFilePath = #file
        let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/list.json")
        let testData = try Data(contentsOf: testDataFilePath)
        let list = try JSONDecoder.scryfallDecoder.decode(List<Card>.self, from: testData)
        XCTAssertNotNil(list.nextPage)
        XCTAssertNil(list.warnings)
    }

    func testSetDecode() throws {
        let testFilePath = #file
        let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/all_sets.json")
        let testData = try Data(contentsOf: testDataFilePath)
        XCTAssertNoThrow(try JSONDecoder.scryfallDecoder.decode([Set].self, from: testData))
    }

    func testCardsDecode() throws {
        let testFilePath = #file

        // all_cards.json contains every single card object in Scryfall and can be used to test successful decoding of all cardsin the database, but running
        // the test with this data set can take a long time. some_cards.json contains a sample of 10,000 of the same cards. Use some_cards.json for quick
        // test runs in iteration, and use all_cards.json to confirm all cards will successfully decode.
        let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/some_cards.json")
        // let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/all_cards.json")
        let testData = try Data(contentsOf: testDataFilePath)

        let allCards = try JSONDecoder.scryfallDecoder.decode([Card].self, from: testData)

        // Make sure no optional field is always `nil`, as this might indicate silent decoding issues
        XCTAssertTrue(allCards.contains(where: { $0.arenaId != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.mtgoId != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.mtgoFoilId != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.multiverseIds != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.tcgplayerId != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.allParts != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.cardFaces != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.colorIndicator != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.colors != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.edhrecRank != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.handModifier != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.lifeModifier != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.loyalty != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.manaCost != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.oracleText != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.power != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.producedMana != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.toughness != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.artist != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.contentWarning != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.flavorName != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.flavorText != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.frameEffects != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.illustrationId != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.lifeModifier != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.imageUris != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.printedName != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.printedText != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.printedTypeLine != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.promoTypes != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.variationOf != nil }))
        XCTAssertTrue(allCards.contains(where: { $0.watermark != nil }))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.artist != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.colorIndicator != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.colors != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.flavorText != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.illustrationId != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.imageUris != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.loyalty != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.oracleText != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.power != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.colorIndicator != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.printedName != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.printedText != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.printedTypeLine != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.toughness != nil }) ?? false)}))
        XCTAssertTrue(allCards.contains(where: { card in (card.cardFaces?.contains(where: { face in face.watermark != nil }) ?? false)}))
    }

    func testRulingsDecode() throws {
        let testFilePath = #file
        let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/rulings.json")
        let testData = try Data(contentsOf: testDataFilePath)
        XCTAssertNoThrow(try JSONDecoder.scryfallDecoder.decode([Ruling].self, from: testData))
    }

    func testSymbolsDecode() throws {
        let testFilePath = #file
        let testDataFilePath = URL(fileURLWithPath: testFilePath).deletingLastPathComponent().appendingPathComponent("Data/Decompressed/all_symbols.json")
        let testData = try Data(contentsOf: testDataFilePath)
        let allSymbols = try JSONDecoder.scryfallDecoder.decode([CardSymbol].self, from: testData)
        XCTAssertTrue(allSymbols.contains(where: { $0.looseVariant != nil }))
        XCTAssertTrue(allSymbols.contains(where: { $0.cmc != nil }))
        XCTAssertTrue(allSymbols.contains(where: { $0.gathererAlternates != nil }))
    }

    static var allTests = [
        ("testCardsDecode", testCardsDecode),
        ("testRulingsDecode", testRulingsDecode)
    ]
}
