//
//  MovieListModel.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 08/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import Foundation

struct MovieListModel: Decodable {
    
    let data: [MovieItem]
    
    private enum CodingKeys: String, CodingKey {
        case data = "Search"
    }
}


struct MovieItem: Decodable {
    
    let title: String?
    let year: String?
    let imdbID: String?
    let type: String?
    let poster: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
