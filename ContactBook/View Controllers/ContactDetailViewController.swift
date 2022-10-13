//
//  ContactDetailViewController.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 06.10.2022.
//

import UIKit

protocol EditContactDelegate {
    func editContact(contact: UserProfile?, contactIndex: Int)
}

class ContactDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberButton: UIButton!
    @IBOutlet weak var contactImageView: UIImageView!
    
    // MARK: - Properties
    var delegate: EditContactDelegate?
    var contactInfo: UserProfile?
    var contactIndex: Int?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setContactDetails()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditContactsPage" {
            let page = segue.destination as? EditContactViewController
            page?.delegate = self
            page?.contact = contactInfo
            page?.contactIndex = contactIndex
        }
    }
    private func setContactDetails() {
        guard let contactInfo = contactInfo else { return }
        nameLabel.text = contactInfo.name
        phoneNumberButton.setTitle(contactInfo.phoneNumber, for: .normal)
        contactImageView.image = UIImage(named: contactInfo.image)
    }
}

extension ContactDetailViewController: EditContactDelegate {
    func editContact(contact: UserProfile?, contactIndex: Int) {
        contactInfo = contact
        delegate?.editContact(contact: contact, contactIndex: contactIndex)
    }
}
