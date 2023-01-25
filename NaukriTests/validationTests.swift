//
//  validationTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

final class validationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidations() throws {
        let val = Validations()
        XCTAssertTrue(val.emailValidation(email: "amreen@gmail.com"))
        XCTAssertFalse(val.emailValidation(email: "amr876"))
        
        XCTAssertTrue(val.passwordValidation(passwords: "Amreen@786"))
        XCTAssertFalse(val.passwordValidation(passwords: "amreen"))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
