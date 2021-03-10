//
//  NASAapodTests.swift
//  NASAapodTests
//
//  Created by Ghufran Latif  on 3/1/21.
//

import XCTest
@testable import NASAapod

class NASAapodTests: XCTestCase {

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumOfItems() {
        let viewModel = ApodViewModel()
        let returnedValue = viewModel.numOfItems()
        XCTAssertEqual(returnedValue, 1)
    }
    
    func testGetDetails() {
        let viewModel = ApodViewModel()
        viewModel.data = ApodModel(
            date: "",
            explanation: "This is the explanation",
            hdurl: "",
            media_type: "",
            service_version: "",
            title: "",
            url: ""
        )
        let returnedDetail = viewModel.getDetails()
        
        XCTAssertEqual(returnedDetail, "This is the explanation")
    }
    
    func testGetTitle() {
        let viewModel = ApodViewModel()
        viewModel.data = ApodModel(
            date: "",
            explanation: "",
            hdurl: "",
            media_type: "",
            service_version: "",
            title: "This is the title",
            url: ""
        )
        
        let returned = viewModel.getTitle()
        
        XCTAssertEqual(returned, "This is the title")
    }
    func testGetDate() {
        let viewModel = ApodViewModel()
        viewModel.data = ApodModel(
            date: "This is the date",
            explanation: "",
            hdurl: "",
            media_type: "",
            service_version: "",
            title: "",
            url: ""
        )
        let returned = viewModel.getDate()
        
        XCTAssertEqual(returned, "This is the date")
    }
    
}
