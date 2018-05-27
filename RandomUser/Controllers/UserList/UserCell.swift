//
//  UserCell.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var loadActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var distinctionLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!

    func setInfo(with data: User) {
        distinctionLabel.text       = data.name.title
        fullNameLabel.text          = data.name.first + " " + data.name.last
        flagLabel.text              = flag(country: data.nat)
    }
    
}
