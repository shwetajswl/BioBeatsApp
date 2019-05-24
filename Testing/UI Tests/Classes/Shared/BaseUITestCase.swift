//
//  BaseUITestCase.swift
//  BioBeatsAppUITests
//
//  Created by Sweta Jaiswal on 20/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import XCTest

class BaseUITestCase: XCTestCase {
    
    let app = XCUIApplication()
    

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }

    
    override func tearDown() {
        super.tearDown()
    }

    
    
    //MARK: - Check the visibility of XCUIElement
    
    func waitForElementToAppear(_ element: XCUIElement) -> Bool {
        
        let predicate = NSPredicate(format: "exists == true")
        let _expectation = expectation(for: predicate, evaluatedWith: element, handler: nil)
        let result = XCTWaiter().wait(for: [_expectation], timeout: 5)
        
        return result == .completed
    }
    
}
