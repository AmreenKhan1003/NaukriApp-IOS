//
//  WelcomeTests.swift
//  NaukriTests
//
//  Created by Capgemini on 10/01/23.
//

import XCTest
@testable import Naukri

final class WelcomeTests: XCTestCase {

    var wel: WelcomeViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        wel = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController
        wel.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIBOutletView() throws {
        
        XCTAssertNotNil(wel.Jobs, "not connected")
        XCTAssertNotNil(wel.sideBarView, "not connected")
        XCTAssertNotNil(wel.profileSideView, "not connected")
        XCTAssertNotNil(wel.skillsTableView, "not connected")
        XCTAssertNotNil(wel.locationTableView, "not connected")
        XCTAssertNotNil(wel.featureCollectionView, "not connected")
        XCTAssertNotNil(wel.sponsoredCollectionView, "not connected")
        XCTAssertNotNil(wel.sideBarItemsView, "not connected")
        XCTAssertNotNil(wel.featureButtonsCollectionView, "not connected")
        XCTAssertNotNil(wel.sponsoredButtonsCollectionView, "not connected")
        
    }
    
    func testIBOutletButtons() throws{
        XCTAssertNotNil(wel.LoginButton, "not connected")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
