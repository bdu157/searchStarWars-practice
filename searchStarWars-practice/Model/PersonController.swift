//
//  PersonController.swift
//  searchStarWars-practice
//
//  Created by Dongwoo Pae on 6/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

class PersonController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    var people: [Person] = []
    
    var baseURL: URL? {
        guard let url = URL(string: "https://swapi.co/api/people") else {return nil}
        return url
    }
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        
        //Ensure Base URL
        guard let baseURL = baseURL else {
            completion()
            return
        }
        
        //Add URL components if necessary
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let searchTermQueryItem = URLQueryItem(name: "search", value: "r2")
        
        urlComponents?.queryItems = [searchTermQueryItem]
        
        //request URL
        guard let requestURL = urlComponents?.url else {
            NSLog("requestURL is nil")
            completion()
            return
        }
        
        //create request
        var request = URLRequest(url: requestURL)
        
        //request.httpMethod = "GET"

        request.httpMethod = HTTPMethod.get.rawValue
        
        //create a data task
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            //handle error case
            if let error = error {
                NSLog("error fetchign data\(error)")
                completion()
                return
            }
            
            //handle data
            guard let data = data else {
                NSLog("no data return from data task")
                completion()
                return
            }
            
            //create a decoder and decoder
            let jsonDecoder = JSONDecoder()
            
            //if json file is inside of array then we use [object] as a parameter in this method
            do {
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
            } catch {
                NSLog("unable to decode data into object of type [Person] : \(error)")
                completion()
            }
            completion()
        }.resume()
    }
}
