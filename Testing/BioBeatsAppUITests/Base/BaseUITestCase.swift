//
//  BaseUITestCase.swift
//  BioBeatsAppUITests
//
//  Created by Sweta Jaiswal on 12/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import XCTest

class BaseUITestCase: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func launchApp() {
        app.launch()
    }

}
