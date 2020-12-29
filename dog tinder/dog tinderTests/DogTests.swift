//
//  DogTests.swift
//  dog tinderTests
//
//  Created by Derrick Lee on 10/12/20.
//

import XCTest
@testable import dog_tinder
class DogTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testDogInfo() {
        let pompom = Dog(image: UIImage(named: "pompom")!, name: "Pebbles", breed: .Pomeranian, gender: .female, temperament: "Lazy", size: .small, weight: "5", description: placeholderDesc)
        XCTAssertEqual(pompom.name, "Pebbles")
        XCTAssertEqual(pompom.breed, .Pomeranian)
        XCTAssertEqual(pompom.temperament, "Lazy")
        XCTAssertEqual(pompom.size, .small)
        XCTAssertEqual(pompom.weight, "5")
        XCTAssertEqual(pompom.description, placeholderDesc)
    }

    func testDogChangeName() {
        let goldie = Dog(image: UIImage(named: "goldie")!, name: "Big Girl", breed: .GoldenRetriever, gender: .female, temperament: "Active", size: .large, weight: "65", description: placeholderDesc)
        goldie.name = "NameChanged"
        XCTAssertEqual(goldie.name, "NameChanged")
    }

    func testDogChangeBreed() {
        let goldie = Dog(image: UIImage(named: "goldie")!, name: "Big Girl", breed: .GoldenRetriever, gender: .female, temperament: "Active", size: .large, weight: "65", description: placeholderDesc)
        goldie.breed = .EnglishBulldog
        XCTAssertEqual(goldie.breed, .EnglishBulldog)
    }

    func testDogChangeGender() {
        let goldie = Dog(image: UIImage(named: "goldie")!, name: "Big Girl", breed: .GoldenRetriever, gender: .female, temperament: "Active", size: .large, weight: "65", description: placeholderDesc)
        goldie.gender = .male
        XCTAssertEqual(goldie.gender, .male)
    }

    func testDogChangeTemperament() {
        let goldie = Dog(image: UIImage(named: "goldie")!, name: "Big Girl", breed: .GoldenRetriever, gender: .female, temperament: "Active", size: .large, weight: "65", description: placeholderDesc)
        goldie.temperament = "Not Active"
        XCTAssertEqual(goldie.temperament, "Not Active")
    }

    func testDogChangeSize() {
        let goldie = Dog(image: UIImage(named: "goldie")!, name: "Big Girl", breed: .GoldenRetriever, gender: .female, temperament: "Active", size: .large, weight: "65", description: placeholderDesc)
        goldie.size = .medium
        XCTAssertEqual(goldie.size, .medium)
    }

    func testDogChangeWeight() {
        let goldie = Dog(image: UIImage(named: "goldie")!, name: "Big Girl", breed: .GoldenRetriever, gender: .female, temperament: "Active", size: .large, weight: "65", description: placeholderDesc)
        goldie.weight = "22"
        XCTAssertEqual(goldie.weight, "22")
    }
}
