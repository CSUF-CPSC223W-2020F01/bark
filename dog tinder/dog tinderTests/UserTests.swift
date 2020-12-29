//
//  UserTests.swift
//  dog tinderTests
//
//  Created by Derrick Lee on 10/12/20.
//

@testable import dog_tinder
import XCTest

class UserTests: XCTestCase {
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

    func testUser() {
        let user2 = User(firstName: "Blue", lastName: "Bayani", city: "Fremon", state: "California", email: "blueb@gmail.com", listOfDogs: [bulldog, goldie])
        XCTAssertEqual(user2.firstName, "Blue")
        XCTAssertEqual(user2.lastName, "Bayani")
        XCTAssertEqual(user2.city, "Fremon")
        XCTAssertEqual(user2.state, "California")
        XCTAssertEqual(user2.email, "blueb@gmail.com")
    }

    func testChangeName() {
        let user2 = User(firstName: "Blue", lastName: "Bayani", city: "Fremon", state: "California", email: "blueb@gmail.com", listOfDogs: [bulldog, goldie])
        user2.firstName = "NameChanged"
        user2.lastName = "NameChanged"
        XCTAssertEqual(user2.firstName, "NameChanged")
        XCTAssertEqual(user2.lastName, "NameChanged")
    }

    func testChangeCity() {
        let user2 = User(firstName: "Blue", lastName: "Bayani", city: "Fremon", state: "California", email: "blueb@gmail.com", listOfDogs: [bulldog, goldie])
        user2.city = "CityChanged"
        XCTAssertEqual(user2.city, "CityChanged")
    }

    func testChangeState() {
        let user2 = User(firstName: "Blue", lastName: "Bayani", city: "Fremon", state: "California", email: "blueb@gmail.com", listOfDogs: [bulldog, goldie])
        user2.state = "StateChanged"
        XCTAssertEqual(user2.state, "StateChanged")
    }

    func testChangeEmail() {
        let user2 = User(firstName: "Blue", lastName: "Bayani", city: "Fremon", state: "California", email: "blueb@gmail.com", listOfDogs: [bulldog, goldie])
        user2.email = "EmailChanged"
        XCTAssertEqual(user2.email, "EmailChanged")
    }
}
