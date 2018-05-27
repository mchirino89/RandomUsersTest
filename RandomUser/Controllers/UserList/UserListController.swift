//
//  UserListController.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

class UserListController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var users: List?

    override func viewDidLoad() {
        super.viewDidLoad()
        readLocalFile(resource: "testData", type: "json")
    }
    
    private func readLocalFile(resource: String, type: String) {
        let decoder = JSONDecoder()
        do {
            guard let file = Bundle.main.url(forResource: resource, withExtension: type) else {
                print("File \(resource).\(type) not found")
                return
            }
            let data    = try Data(contentsOf: file)
            users       = try decoder.decode(List.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? UserDetailsViewController, let currentUser = sender as? User else { return }
        destination.infoDetails = currentUser
    }
}
