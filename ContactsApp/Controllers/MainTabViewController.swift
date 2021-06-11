//
//  MainTabViewController.swift
//  ContactsApp
//
//  Created by ilabrosimov on 11.06.2021.
//

import UIKit

class MainTabViewController: UITabBarController {

    private var personsList : [Person] = Person.getPersons()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewControllers = self.viewControllers else {return}
        viewControllers.forEach{
            guard let navigationVc = $0 as? UINavigationController else {return}
            
               if  let personsVC = navigationVc.topViewController as? PersonViewController
               { personsVC.personsList = personsList}
             
                if let customPersonsVC = navigationVc.topViewController as? CustomPersonViewController
                {customPersonsVC.persons = personsList}
            
          
        }
        
        // Do any additional setup after loading the view.
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
