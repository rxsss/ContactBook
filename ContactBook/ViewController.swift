//
//  ViewController.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var names: [UserProfile] = [
        UserProfile(name: "Rakhman", image: "rakhman_avatar", phoneNumber: "+77064294158"),
        UserProfile(name: "Rauan", image: "rauan_avatar", phoneNumber: "+77066473975")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContactDetailPage" {
            let page = segue.destination as? ContactDetailViewController
            let index = tableView.indexPathForSelectedRow?.row
            if let index = index {
                page?.contactInfo = names[index]
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.nameLabel.text = names[indexPath.row].name
        cell?.contactImageView.image = UIImage(named: names[indexPath.row].image)
        cell?.numberLabel.text = names[indexPath.row].phoneNumber
        return cell!
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _,_ in
            self.names.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let pinAction = UITableViewRowAction(style: .default, title: "Pin") { _,_ in
            print("Add to favorites")
        }
        pinAction.backgroundColor = .green
        
        return [deleteAction, pinAction]
    }
}
