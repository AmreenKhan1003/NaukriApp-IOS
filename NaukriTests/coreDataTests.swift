//
//  coreDataTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

final class coreDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoreData() throws {
        let data = UserOnCoreData()
        
        XCTAssertTrue(data.StoreOnCoreData(names: "TestName", emails: "test@gmail.com", passwords: "Test123", mobiles: "6699887744", loggedIn: true, loggedOut: false))
        
        XCTAssertTrue(data.FetchEmailFromCoreData(email: "test@gmail.com"))
        
        XCTAssertTrue(data.FetchPasswordFromCoreData(email: "test@gmail.com", password: "Test123"))
        
        XCTAssertFalse(data.checkUserLoggedIn())
        
        XCTAssertTrue(data.checkLogType())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
