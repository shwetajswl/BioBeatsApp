//
//  MovieDetailsUITests.swift
//  BioBeatsAppUITests
//
//  Created by Sweta Jaiswal on 20/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import XCTest

class MovieDetailsUITests: BaseUITestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testMovieDetailsUIComponents() {
        
        let listTable = app.tables[Accessibility.Identifiers.MoviesList.Table.tableView]
        listTable.cells["MovieListCell_Index_0"].tap()
        
        // UI components of details screen
        
        let table = app.tables[Accessibility.Identifiers.MovieDetails.Table.tableView]
        let cell_0 = table.cells["MovieDetailsCell_Index_0"]
        let cell_1 = table.cells["MovieDetailsCell_Index_1"]
        
        let crossBtn = app.buttons[Accessibility.Identifiers.MovieDetails.crossbutton]
        
        let title_0 = cell_0.staticTexts[Accessibility.Identifiers.MovieDetails.Table.Cell.titleLbl]
        let descTxtView_0 = cell_0.textViews[Accessibility.Identifiers.MovieDetails.Table.Cell.valueLbl]
        let imageView_0 = cell_0.images[Accessibility.Identifiers.MovieDetails.Table.Cell.imageView]
        
        let title_1 = cell_1.staticTexts[Accessibility.Identifiers.MovieDetails.Table.Cell.titleLbl]
        let descTxtView_1 = cell_1.textViews[Accessibility.Identifiers.MovieDetails.Table.Cell.valueLbl]
        let imageView_1 = cell_1.images[Accessibility.Identifiers.MovieDetails.Table.Cell.imageView]
        
        XCTAssertTrue(waitForElementToAppear(crossBtn))
        
        XCTAssertFalse(waitForElementToAppear(title_0))
        XCTAssertFalse(waitForElementToAppear(descTxtView_0))
        XCTAssertTrue(waitForElementToAppear(imageView_0))
        
        XCTAssertTrue(title_1.isHittable)
        XCTAssertTrue(descTxtView_1.isHittable)
        XCTAssertFalse(imageView_1.exists)
        
    }
    
}

  
