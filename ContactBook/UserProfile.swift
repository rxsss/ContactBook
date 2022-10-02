//
//  UserProfile.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 29.09.2022.
//

import Foundation

class UserProfile {
    let name: String
    let surname: String
    let phoneNumber: String
    
    init(name: String, surname: String, phoneNumber: String) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
    }
}
