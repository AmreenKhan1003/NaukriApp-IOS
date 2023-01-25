//
//  InboxTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

 

 

class inboxesTests: XCTestCase {

    var inboxes: InboxViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Inboxess", bundle: nil)
        inboxes = storyboard.instantiateViewController(withIdentifier: "InboxViewController") as? InboxViewController
         inboxes.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 
    func testIBOutletView() throws{
           XCTAssertNotNil(inboxes.sideBarView, "Not connected")
           XCTAssertNotNil(inboxes.profileSideView, "Not connected")
        XCTAssertNotNil(inboxes.InboxView, "Not connected")
       }
    func testIBOutletButton() throws{
        XCTAssertNotNil(inboxes.registerButtonClicked(_:), "Not connected")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
