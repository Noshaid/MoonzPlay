//
//  MoonzPlayUITests.swift
//  MoonzPlayUITests
//
//  Created by Noshaid Ali on 30/08/2024.
//

import XCTest

final class MoonzPlayUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNormalLaunch_whenTheAppIsLaunched_HomeScreenDisplayCorrectly() throws {
        app = XCUIApplication()
        app.launchArguments = [UITestingConstants.LaunchArguments.enableUITesting.rawValue]
        app.launch()

        let titleLabel = app.staticTexts["Friends"].waitForExistence(timeout: 1.0)
        let playButton = app.buttons["Play"].waitForExistence(timeout: 1.0)
        let readMoreButton = app.buttons["Read More"].waitForExistence(timeout: 1.0)
        
        XCTAssertTrue(titleLabel)
        XCTAssertTrue(playButton)
        XCTAssertTrue(readMoreButton)
    }
}
