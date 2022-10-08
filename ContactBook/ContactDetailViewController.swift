//
//  ContactDetailViewController.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 06.10.2022.
//

import UIKit

class ContactDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberButton: UIButton!
    @IBOutlet weak var contactImageView: UIImageView!
    var contactInfo: UserProfile?

    override func viewDidLoad() {
        super.viewDidLoad()
        setContactDetails()
    }
    private func setContactDetails() {
        guard let contactInfo = contactInfo else { return }
        nameLabel.text = contactInfo.name
        phoneNumberButton.setTitle(contactInfo.phoneNumber, for: .normal)
        contactImageView.image = UIImage(named: contactInfo.image)
    }
}
