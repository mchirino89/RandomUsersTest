//
//  User.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import Foundation

struct Id: Decodable {
    var title:      String
    var first:      String
    var last:       String
}

struct Address: Decodable {
    var street:     String
    var city:       String
    var state:      String
    var postcode:   Int
}

struct Credentials: Decodable {
    var username:   String
    var password:   String
    var salt:       String
    var md5:        String
    var sha1:       String
    var sha256:     String
}

struct Identifier: Decodable {
    var name:       String
    var value:      String
}

struct Image: Decodable {
    var large:      String
    var medium:     String
    var thumbnail:  String
}

struct User: Decodable {
    var gender:     String
    var name:       Id
    var location:   Address
    var email:      String
    var login:      Credentials
    var dob:        String
    var registered: String
    var phone:      String
    var cell:       String
    var id:         Identifier
    var picture:    Image
    var nat:        String
}
