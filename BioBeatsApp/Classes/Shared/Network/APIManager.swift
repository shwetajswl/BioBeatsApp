//
//  APIManager.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 08/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import UIKit
import Alamofire


protocol APIManagerProtocol {
    
    func getMoviesList(params: inout [String: String], completion: @escaping (Bool, Any?) -> Void)
    func getMovieDetails(params: inout [String: String], completion: @escaping (Bool, Any?) -> Void)
}


class APIManager: APIManagerProtocol {
    
    private let getMoviesList = Endpoint.getMoviesList.rawValue
    private let getMovieDetail = Endpoint.getMovieDetail.rawValue
    private let timeOutInterval = 20.0
    
    
    
    //MARK: - API 1 - Get movies list based on search keyword
    
    func getMoviesList(params: inout [String: String], completion: @escaping (Bool, Any?) -> Void) {
        
        let url = URL(string: getMoviesList)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = timeOutInterval
        
        params["apiKey"] = "2b6ce25b"
        params["movie"] = "type"
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) -> Void in
            
            switch response.result {
                
            case .success(let result):
                
                if let json = result as? Dictionary<String,Any> {
                    guard json["Search"] != nil, let data = response.data else {
                        print("Error: No data to decode")
                        completion(false, nil)
                        return
                    }
                    
                    guard let model = try? JSONDecoder().decode(MovieListModel.self, from: data) else {
                        print("Error: Couldn't decode data into MovieListModel")
                        completion(false, nil)
                        return
                    }
                    
                    completion(true, model.data)
                }
                
                break
                
            case .failure(_):
                completion(false, nil)
                break
            }
        }
    }
    
    
    //MARK: - API 2 - Get movie details
    
    func getMovieDetails(params: inout [String: String], completion: @escaping (Bool, Any?) -> Void) {
        
        let url = URL(string: getMovieDetail)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = timeOutInterval
        
        params["apiKey"] = "2b6ce25b"
        params["movie"] = "type"
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) -> Void in
            
            switch response.result {
                
            case .success(let result):
                
                if let _ = result as? Dictionary<String,Any> {
                    guard let data = response.data else {
                        print("Error: No data to decode")
                        completion(false, nil)
                        return
                    }
                    
                    guard let model = try? JSONDecoder().decode(MovieDetailModel.self, from: data) else {
                        print("Error: Couldn't decode data into MovieDetailModel")
                        completion(false, nil)
                        return
                    }
                    
                    completion(true, model)
                }
                
                break
                
            case .failure(_):
                completion(false, nil)
                break
            }
        }
    }
    
}
