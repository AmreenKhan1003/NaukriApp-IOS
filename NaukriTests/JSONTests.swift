//
//  JSONTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

final class JSONTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJSONS() throws {
        let parse = ParseJSON()
        
        XCTAssertNotNil(parse.fetchSkills())
        
        XCTAssertNotNil(parse.fetchLocations())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
