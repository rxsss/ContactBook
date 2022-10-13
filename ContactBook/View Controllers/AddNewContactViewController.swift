//
//  AddNewContactViewController.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 13.10.2022.
//

import UIKit

protocol AddNewContactDelegate {
    func addNewContact(contact: UserProfile)
}

class AddNewContactViewController: UIViewController {
    var delegate: AddNewContactDelegate?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func doneDidPressed(_ sender: Any) {
        guard
            let name = nameTextField.text,
            name != "",
            let phoneNumber = phoneNumberTextField.text,
            phoneNumber != ""
        else {
            return
        }
        let contact = UserProfile(name: name, image: "profile", phoneNumber: phoneNumber)
        delegate?.addNewContact(contact: contact)
        navigationController?.popViewController(animated: true)
    }
}
