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
    var personsList: [Person] = []
    private var currentPerson : Person?
    
  
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let PersonInfoVC = segue.destination as? PersonInfoViewController else { return }
        guard let person = currentPerson else {return}
        PersonInfoVC.person = person
    }
}
    //MARK: - Extensions
extension PersonViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentPerson = personsList[indexPath.row]
        performSegue(withIdentifier: "personInfoSegue", sender: nil)
    }
    
}

extension PersonViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = personsList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(person.name)  \(person.lastName)"
        cell.contentConfiguration = content
        return cell
    }
}
