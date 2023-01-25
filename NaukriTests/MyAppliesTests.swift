//
//  MyAppliesTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

 

class MyAppliesTests: XCTestCase {

 

    var applies: MyAppliesViewController!
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "MyApplies", bundle: nil)
        applies = storyboard.instantiateViewController(withIdentifier: "MyAppliesViewController") as? MyAppliesViewController
         applies.loadView()
    }

 

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 

    func testIBOutletView() throws{
        XCTAssertNotNil(applies.MyAppliesView, "Not connected")
        XCTAssertNotNil(applies.sideBarView, "Not connected")
        XCTAssertNotNil(applies.ProfileSideView, "Not connected")
        XCTAssertNotNil(applies.sideBarItemsView, "Not connected")
       }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

 

}
