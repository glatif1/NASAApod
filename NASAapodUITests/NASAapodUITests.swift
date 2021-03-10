//
//  NASAapodUITests.swift
//  NASAapodUITests
//
//  Created by Ghufran Latif  on 3/1/21.
//

import XCTest

class NASAapodUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        _ = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier:"Stars over an Erupting Volcano").element.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        app.staticTexts["2021-03-03"].tap()
        element.children(matching: .textView).element.tap()
        
        let starsOverAnEruptingVolcanoNavigationBar = app.navigationBars["Stars over an Erupting Volcano"]
        starsOverAnEruptingVolcanoNavigationBar.staticTexts["Stars over an Erupting Volcano"].tap()
        
        let nasaApiButton = starsOverAnEruptingVolcanoNavigationBar.buttons["NASA API"]
        nasaApiButton.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Stars over an Erupting Volcano"]/*[[".cells.staticTexts[\"Stars over an Erupting Volcano\"]",".staticTexts[\"Stars over an Erupting Volcano\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        nasaApiButton.tap()
        app.navigationBars["NASA API"].staticTexts["NASA API"].tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
