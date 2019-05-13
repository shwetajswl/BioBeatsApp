//
//  MovieDetailModel.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 09/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import Foundation

struct MovieDetailModel: Decodable {
    
    let title: String?
    let year: String?
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let poster: String?
    let metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let type: String?
    let dvd: String?
    let boxOffice: String?
    let production: String?
    let website: String?
    let awards: String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case awards = "Awards"

    }
    
    func convertToDict() -> [String: Any] {
        
        var dict = [String: Any]()
        
        dict["Title"] = title
        dict["Year"] = year
        dict["Rated"] = rated
        dict["Released"] = released
        dict["Runtime"] = runtime
        dict["Genre"] = genre
        dict["Director"] = director
        dict["Writer"] = writer
        dict["Plot"] = plot
        dict["Language"] = language
        dict["Country"] = country
        dict["Poster"] = poster
        dict["Metascore"] = metascore
        dict["IMDB Rating"] = imdbRating
        dict["IMDB Votes"] = imdbVotes
        dict["IMDB ID"] = imdbID
        dict["Type"] = type
        dict["DVD"] = dvd
        dict["Box Office"] = boxOffice
        dict["Production"] = production
        dict["Website"] = website
        dict["Awards"] = awards

        return dict
    }
    
}


