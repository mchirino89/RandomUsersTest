//
//  UserListController.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

class UserListController: UIViewController {
    
    var users: List!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? UserDetailsViewController, let currentUser = sender as? User else { return }
        destination.infoDetails = currentUser
    }
}
