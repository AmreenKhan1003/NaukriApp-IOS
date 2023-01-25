//
//  RegisterTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

final class RegisterTests: XCTestCase {

    var regis: RegisterViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        regis = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        regis.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIBOutletTextFields() throws {
        
        XCTAssertNotNil(regis.emailTextField, "not connected")
        XCTAssertNotNil(regis.nameTextField, "not connected")
        XCTAssertNotNil(regis.mobileNumTextField, "not connected")
        XCTAssertNotNil(regis.passwordTextField, "not connected")
        XCTAssertNotNil(regis.emailTextField, "not connected")
    }
    
    func testIBOutletsButtons() throws{
        
        XCTAssertNotNil(regis.registerButton, "not connected")
        XCTAssertNotNil(regis.showButton, "not connected")
        XCTAssertNotNil(regis.updateResumebtn, "not connected")
        
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
