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
    var profileImageLink = ""

    func setInfo(with data: User) {
        distinctionLabel.text       = data.name.title.capitalized
        fullNameLabel.text          = data.name.first.fullName(data.name.last)
        flagLabel.text              = flag(country: data.nat)
        thumbnailImageView.image    = data.gender.lowercased() == "male" ? #imageLiteral(resourceName: "man") : #imageLiteral(resourceName: "woman")
        profileImageLink            = data.picture.large
        loadActivityIndicator.startAnimating()
        isUserInteractionEnabled    = !loadActivityIndicator.isAnimating
    }
    
    func loadFinished() {
        DispatchQueue.main.async { [unowned self]  in
            self.loadActivityIndicator.stopAnimating()
            self.isUserInteractionEnabled = true
        }
    }
    
}
