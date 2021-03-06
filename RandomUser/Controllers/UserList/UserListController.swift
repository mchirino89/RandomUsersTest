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
    @IBOutlet weak var initLoadVisualEffectView: UIVisualEffectView!
    let imageLoadQueue = OperationQueue()
    var imageLoadOperations = [IndexPath: ImageLoadOperation]()
    var users: List?

    override func viewDidLoad() {
        super.viewDidLoad()
//        readLocalFile(resource: "testData", type: "json")
        getUsersList()
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
    
    private func setCachedProfileImage(_ key: NSString, _ image: UIImage) {
        cache.setObject(image, forKey: key)
    }
    
    private func getUsersList() {
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: UserList.API, completionHandler: { [unowned self] dataRetrieved, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = dataRetrieved, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    self.users = try decoder.decode(List.self, from: data)
                    DispatchQueue.main.async {
                        self.listTableView.reloadData()
                        self.listTableView.reloadRows(at: self.listTableView.indexPathsForVisibleRows!, with: .middle)
                        UIView.animate(withDuration: 0.3, animations: {
                            self.initLoadVisualEffectView.alpha = 0
                        }, completion: { _ in
                            self.view.sendSubview(toBack: self.initLoadVisualEffectView)
                        })
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }).resume()
    }
    
    func queueProfileImage(for cell: UserCell, at index: IndexPath) {
        let currentURL = URL(string: users!.results[index.row].picture.large)!
        guard let cachedImage = getCachedProfileImage(at: currentURL.absoluteString as NSString) else {
            if let imageLoadOperation = imageLoadOperations[index],
                let image = imageLoadOperation.image {
                setProfileImage(cell, image, currentURL.absoluteString)
                setCachedProfileImage(currentURL.absoluteString as NSString, image)
            } else {
                let imageLoadOperation = ImageLoadOperation(currentURL)
                imageLoadOperation.completionHandler = { [unowned self] (image) in
                    self.setProfileImage(cell, image, currentURL.absoluteString)
                    self.setCachedProfileImage(currentURL.absoluteString as NSString, image)
                    self.imageLoadOperations.removeValue(forKey: index)
                }
                imageLoadQueue.addOperation(imageLoadOperation)
                imageLoadOperations[index] = imageLoadOperation
            }
            return
        }
        setProfileImage(cell, cachedImage, currentURL.absoluteString)
    }
    
    private func setProfileImage(_ cell: UserCell, _ image: UIImage, _ url: String) {
        if cell.profileImageLink == url {
            cell.thumbnailImageView.setImage(image)
            cell.loadFinished()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? UserDetailsViewController, let currentUser = sender as? User else { return }
        destination.infoDetails = currentUser
    }
}
