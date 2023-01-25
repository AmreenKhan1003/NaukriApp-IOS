//
//  profileTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri
class ProfileTests: XCTestCase {

 

    var profile: ProfilesViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

 

               let storyboard = UIStoryboard(name: "profile", bundle: nil)

 

               profile = storyboard.instantiateViewController(withIdentifier: "ProfilesViewController") as? ProfilesViewController

 

              profile.loadView()
    }

 

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 

    func testIBOutletView() throws {
        XCTAssertNotNil(profile.profileView, "not connected")
    }

 

    func testIBOutletButtons() throws {
      //  XCTAssertNotNil(profile.registerBtn, "not connected")
        XCTAssertNotNil(profile.profile, "not connected")
        XCTAssertNotNil(profile.performance, "not connected")
    }

    func testIBOutletLable() throws {
        XCTAssertNotNil(profile.detailLabel, "not connected")
        XCTAssertNotNil(profile.profileLabel, "not connected")
    }
    func testIBOutletBottomContraints() throws {
        XCTAssertNotNil(profile.profileBottomConstraint, "not connected")
        XCTAssertNotNil(profile.profileBottomConstraint, "not connected")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

 

}
