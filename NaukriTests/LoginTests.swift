//
//  LoginTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

final class LoginTests: XCTestCase {
    
    var logins: LoginViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        logins = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        logins.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIBOutletButtons() throws {
        
        XCTAssertNotNil(logins.emailButton, "not connected")
        XCTAssertNotNil(logins.usernameButton, "not connected")
        XCTAssertNotNil(logins.loginButton, "not connected")
        XCTAssertNotNil(logins.loginOTPButton, "not connected")
    
    }
    
    func testIBOutletLabel() throws{
        
        XCTAssertNotNil(logins.emailLabel, "not connected")
        XCTAssertNotNil(logins.passwordLabel, "not connected")
        
        XCTAssertNotNil(logins.emailmsgLabel, "not connected")
        XCTAssertNotNil(logins.passmsgLabel, "not connected")
        
    }
    
    func testIBOutletView() throws{
        
        XCTAssertNotNil(logins.emailLineView, "Not connected")
        XCTAssertNotNil(logins.passLineView, "Not connected")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
