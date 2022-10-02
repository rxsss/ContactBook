//
//  UserProfile.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 29.09.2022.
//

import Foundation

class UserProfile {
    let name: String
    let image: String
    let phoneNumber: String
    
    init(name: String, image: String, phoneNumber: String) {
        self.name = name
        self.image = image
        self.phoneNumber = phoneNumber
    }
}
