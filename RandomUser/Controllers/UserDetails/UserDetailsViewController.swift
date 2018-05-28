//
//  UserDetailsViewController.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    lazy var prettyFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }()
    var infoDetails: User!
    
}

extension UserDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return UserDetails.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSecion = UserDetails.sections.init(rawValue: indexPath.section)!
        switch currentSecion {
            case .profilePicture:
                let cell = tableView.dequeueReusableCell(withIdentifier: UserDetails.picCell) as! PictureCell
                cell.setUserImage(imageId: infoDetails.picture.large)
                return cell
            case .personal:
                let cell = tableView.dequeueReusableCell(withIdentifier: UserDetails.infoCell) as! InfoCell
                let customText = flag(country: infoDetails.nat) + " " + infoDetails.gender.capitalized
                var dateOfBirth = ""
                if let validBirth = dateFormatter.date(from: infoDetails.dob) {
                    dateOfBirth = prettyFormatter.string(from: validBirth)
                }
                cell.setSectionInfo(indexPath.section, main: customText, secondary: infoDetails.name.first.fullName(infoDetails.name.last), supplement: dateOfBirth)
                return cell
            case .credentials:
                let cell = tableView.dequeueReusableCell(withIdentifier: UserDetails.infoCell) as! InfoCell
                var registration = ""
                if let validRegistration = dateFormatter.date(from: infoDetails.registered) {
                    registration = prettyFormatter.string(from: validRegistration)
                }
                cell.setSectionInfo(indexPath.section, main: infoDetails.login.username, secondary: infoDetails.login.sha1, supplement: registration)
                return cell
            case .contact:
                let cell = tableView.dequeueReusableCell(withIdentifier: UserDetails.infoCell) as! InfoCell
                cell.setSectionInfo(indexPath.section, main: infoDetails.phone, secondary: infoDetails.cell, supplement: infoDetails.email)
                return cell
        }
    }
    
}

extension UserDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserDetails.rowHeight
    }
}
