
import UIKit

class MainTabViewController: UITabBarController {
    //Получение данных из модели
    private var personsList : [Person] = Person.getPersons()
    
    // Передача данных в другие TabBarItems
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
    }
}
