//
//  ViewController.swift
//  ContactsApp
//
//  Created by ilabrosimov on 08.06.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contactsList: [Person] = Person.getPerson()
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.rowHeight = 50
        
    }

   
}
extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue", sender: nil)
        //отослать person [indexPath.row]
    }
}

extension MainViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = contactsList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(person.name)  \(person.lastName)"
        cell.contentConfiguration = content
        return cell
    }
    
    
}
