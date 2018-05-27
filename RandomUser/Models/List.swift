//
//  List.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import Foundation

struct Pagging: Decodable {
    var seed: String
    var results: Int
    var page: Int
    var version: String
}

struct List: Decodable {
    var results: [User]
    var info: Pagging
}
