//
//  Accessibility.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 12/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import Foundation

struct Accessibility {
    
    struct Identifiers {
        
        struct MoviesList {
            
            static let navigationTitle = "NAVIGATION_TITLE_TEXT"
            static let activityIndicator = "MOVIE_DETAIL_ACTIVITY_INDICATOR"
            
            struct Table {
                static let tableView = "MOVIE_LIST_TABLE_VIEW"
                
                struct header {
                    static let searchBar = "MOVIE_LIST_HEADER_SEARCH_BAR"
                    static let placeholderText = "MOVIE_LIST_HEADER_SEARCH_BAR_PLACEHOLDER_TEXT"
                    static let cancelButton = "MOVIE_LIST_HEADER_SEARCH_BAR_CANCEL_BUTTON"
                }
                
                struct Cell {
                    static let imageView = "MOVIE_LIST_CELL_IMAGE_VIEW"
                    static let title = "MOVIE_LIST_CELL_TITLE_LABEL"
                    static let activityIndicator = "MOVIE_LIST_CELL_IMAGE_VIEW_ACTIVITY_INDICATOR"
                }
            }
        }
        
        
        struct MovieDetails {
            
            static let crossbutton = "MOVIE_DETAIL_CROSS_BUTTON"
            static let activityIndicator = "MOVIE_DETAIL_ACTIVITY_INDICATOR"
            
            struct Table {
                static let tableview = "MOVIE_DETAIL_TABLE_VIEW"
                
                struct Cell {
                    static let titleLbl = "MOVIE_DETAIL_CELL_TITLE_LABEL"
                    static let valueLbl = "MOVIE_DETAIL_CELL_VALUE_LABEL"
                    static let imageView = "MOVIE_DETAIL_CELL_IMAGE_VIEW"
                    static let activityIndicator = "MOVIE_DETAIL_CELL_IMAGE_VIEW_ACTIVITY_INDICATOR"
                }
            }
        }
        
        
    }

}

