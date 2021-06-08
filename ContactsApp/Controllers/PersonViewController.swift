//
//  ViewController.swift
//  ContactsApp
//
//  Created by ilabrosimov on 08.06.2021.
//

import UIKit

class PersonViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet weak var contactsTableView: UITableView!
    
    //MARK: - Private Properities
    private var contactsList: [Person] = Person.getPersons()
    private var personIndex: Int = 0
  
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let PersonInfoVC = segue.destination as? PersonInfoViewController else {return}
        PersonInfoVC.person = contactsList[personIndex]
    }
}
    //MARK: - Extensions
extension PersonViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        personIndex = indexPath.row
        performSegue(withIdentifier: "cellSegue", sender: nil)
        
    }
}

extension PersonViewController : UITableViewDataSource{
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
