//
//  MoviesListUITest.swift
//  BioBeatsAppUITests
//
//  Created by Sweta Jaiswal on 12/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import XCTest

class MoviesListUITest: BaseUITestCase {

    override func setUp() {
        super.setUp()
   
        launchApp()
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testUIElements() {
        
        let table = app.tables[Accessibility.Identifiers.MoviesList.Table.tableView]
        let imageView = table.cells.images[Accessibility.Identifiers.MoviesList.Table.Cell.imageView]
        let title = table.cells.staticTexts[Accessibility.Identifiers.MoviesList.Table.Cell.title]
        
        XCTAssertTrue(waitForElementToAppear(title))
        XCTAssertTrue(waitForElementToAppear(imageView))
    }

}
