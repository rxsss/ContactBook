//
//  EditContactViewController.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 08.10.2022.
//

import UIKit

class EditContactViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    var contact: UserProfile?
    var contactIndex: Int?
    var delegate: EditContactDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setContactDetails()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private methods
    private func setContactDetails() {
        guard let contact = contact else { return }
        nameField.text = contact.name
        phoneField.text = contact.phoneNumber
    }
    
    // MARK: - Public methods
    @IBAction func doneDidPressed(_ sender: UIBarButtonItem) {
        guard let contactIndex = contactIndex, let name = nameField.text, let number = phoneField.text else { return }
        contact?.name = name
        contact?.phoneNumber = number
        
        delegate?.editContact(contact: contact, contactIndex: contactIndex)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
