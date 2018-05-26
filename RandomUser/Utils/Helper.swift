//
//  Helper.swift
//  RandomUser
//
//  Created by Mauricio Chirino on 26/5/18.
//  Copyright © 2018 Mauricio Chirino. All rights reserved.
//

import Foundation

func flag(country: String) -> String {
    let base: UInt32 = 127397
    return country.uppercased().unicodeScalars.map { String(UnicodeScalar(base + $0.value)!) }.joined()
}
