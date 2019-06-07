//
//  Person.swift
//  searchStarWars-practice
//
//  Created by Dongwoo Pae on 6/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

struct PersonSearch: Decodable {
    var results: [Person]
}

struct Person: Decodable {
    var name: String
    var gender: String
    var birthYear: String
}
