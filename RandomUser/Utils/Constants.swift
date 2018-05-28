//
//  Constants.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

struct UserList {
    static let API                  = URL(string: "https://randomuser.me/api/?page=1&results=50&seed=abc&format=pretty&exc=id,location")!
    static let cellName             = "userCell"
    static let segue                = "userDetailsSegue"
    static let rowHeight:CGFloat    = 72
}

struct UserDetails {
    
    static let picCell              = "pictureCell"
    static let infoCell             = "infoCell"
    static let rowHeight:CGFloat    = 162
    
    enum sections: Int {
        case profilePicture
        case personal
        case credentials
        case contact
    }
    
    static let sectionTitles = ["", "Personal information", "Credentials", "Contact"]
}


