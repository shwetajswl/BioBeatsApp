//
//  Endpoint.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 08/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint: RawRepresentable {
    
    typealias RawValue = String
    
    case baseUrl
    case getMoviesList
    case getMovieDetail
    
    init?(rawValue: RawValue) {
        fatalError("Cannot initialise endpoint from \(rawValue) - not implemented")
    }
    
    var rawValue: RawValue {
        switch self {
        case .baseUrl:
            return "https://www.omdbapi.com"
            
        case .getMoviesList:
            return "\(Endpoint.baseUrl.rawValue)/"
            
        case .getMovieDetail:
            return "\(Endpoint.baseUrl.rawValue)/"
        }
    }
    
    
    var timeoutInterval: TimeInterval { return 20 }
    
    init?(headers: HTTPHeaders) {
        fatalError("Cannot initialise headers from \(headers) - not implemented")
    }
    
    var headers: HTTPHeaders {
        
        let headers: [String: String] = [:]
       
        switch self {
        case .baseUrl:
            break
            
        case .getMoviesList:
            break
            
        case .getMovieDetail:
            break
        }
        
        return headers
    }
    
}
