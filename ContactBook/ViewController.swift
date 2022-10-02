//
//  ViewController.swift
//  ContactBook
//
//  Created by Rakhman Magametov on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var names: [UserProfile] = [
        UserProfile(name: "Rakhman", image: "rakhman_avatar", phoneNumber: "+77064294158"),
        UserProfile(name: "Rauan", image: "rauan_avatar", phoneNumber: "+77066473975")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
}
