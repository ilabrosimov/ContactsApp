//
//  PersonInfoViewController.swift
//  ContactsApp
//
//  Created by ilabrosimov on 08.06.2021.
//

import UIKit

class PersonInfoViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var person : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person?.name ?? "") \(person?.lastName ?? "")"
        phoneLabel.text = person?.tel ?? ""
        emailLabel.text = person?.email ?? ""


    }
    



}
