//
//  InfoCell.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 27/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var supplementLabel: UILabel!
    
    func setSectionInfo(_ currentSection: Int, main: String, secondary: String, supplement: String) {
        titleLabel.text             = "\t" + UserDetails.sectionTitles[currentSection]
        mainLabel.text              = main
        secondaryLabel.text         = secondary
        supplementLabel.text        = supplement
        supplementLabel.isHidden    = supplement.isEmpty
    }
    
}
