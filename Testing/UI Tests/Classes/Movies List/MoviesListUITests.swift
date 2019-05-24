//
//  MovieListUITests.swift
//  BioBeatsAppUITests
//
//  Created by Sweta Jaiswal on 20/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import XCTest

class MoviesListUITests: BaseUITestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

   
    func testMovieListUIComponents() {
   
        let tableView = app.tables.matching(identifier: Accessibility.Identifiers.MoviesList.Table.tableView)
        
        let title = tableView.cells.staticTexts[Accessibility.Identifiers.MoviesList.Table.Cell.titleLbl]
        let imgView = tableView.cells.images[Accessibility.Identifiers.MoviesList.Table.Cell.imageView]
        
        XCTAssertTrue(waitForElementToAppear(title))
        XCTAssertTrue(waitForElementToAppear(imgView))
        
    }

    
}
