//
//  PictureCell.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 27/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    func setUserImage(imageId: String) {
        avatarImageView.image = getCachedProfileImage(at: NSString(string: imageId))
    }

}
