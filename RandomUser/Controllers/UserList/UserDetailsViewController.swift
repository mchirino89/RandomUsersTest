//
//  UserDetailsViewController.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var infoDetails: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readLocalFile(resource: "testData", type: "json")
    }

    private func readLocalFile(resource: String, type: String) {
        do {
            guard let file = Bundle.main.url(forResource: resource, withExtension: type) else {
                print("File \(resource).\(type) not found")
                return
            }
            let data = try Data(contentsOf: file)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
