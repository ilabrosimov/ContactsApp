//
//  SecondaryPersonViewController.swift
//  ContactsApp
//
//  Created by ilabrosimov on 08.06.2021.
//

import UIKit

class CustomPersonViewController: UIViewController {
    
    @IBOutlet weak var customPersonTableView : UITableView!
    var persons : [Person] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        customPersonTableView.delegate = self
        customPersonTableView.dataSource = self
       title = "Custom Persons List"
        

    }
}
//MARK: - Extensions
extension CustomPersonViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0...persons.count
        {
            
            if section == i {
                return persons[i].name
            }
        }
        return ""
        
    }
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonInfoCell") as! CustomPersonViewCell
        if (indexPath.row % 2 == 0) {
            cell.imageView?.image = UIImage.init(systemName: "phone")
            cell.descriptionLabel.text = persons[indexPath.section].tel
            
        }
        if (indexPath.row % 2 != 0) {
            cell.imageView?.image = UIImage.init(systemName: "envelope")
            cell.descriptionLabel.text = persons[indexPath.section].email
            
            }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        var sectionIndex = 0
        for person in persons {
            if section == sectionIndex {
                label.text = person.name + " " + person.lastName
                label.font = .boldSystemFont(ofSize: 25)
                
            }
            sectionIndex += 1
        }
        label.backgroundColor = .systemGray5
        
        return label
    }
 
    
}
extension CustomPersonViewController : UITableViewDelegate {
   
    
}
