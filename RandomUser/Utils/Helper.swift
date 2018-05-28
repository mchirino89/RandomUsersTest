//
//  Helper.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import UIKit

let cache = NSCache<NSString, UIImage>()

func flag(country: String) -> String {
    let base: UInt32 = 127397
    return country.uppercased().unicodeScalars.map { String(UnicodeScalar(base + $0.value)!) }.joined()
}

func getCachedProfileImage(at key: NSString) -> UIImage? {
    guard let cachedVersion = cache.object(forKey: key) else { return nil }
    return cachedVersion
}

extension String {
    func fullName(_ lastName: String) -> String {
        return self.capitalized + " " + lastName.capitalized
    }
}
