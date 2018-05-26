//
//  List.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import Foundation

struct List {
    var collection: [User]
    
    enum CodingKeys: String, CodingKey {
        case collection = "results"
    }
}
