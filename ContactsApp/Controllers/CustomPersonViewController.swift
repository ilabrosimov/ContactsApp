
import UIKit
class CustomPersonViewController : UIViewController {
//MARK: - Properties
    var persons : [Person] = []
    
    private let personsTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return tableView
    }()
//MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Persons  List"
        view.addSubview(personsTableView)
        personsTableView.dataSource = self
        personsTableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        personsTableView.frame = view.bounds
    }
}
//MARK: - Extensions DataSource
extension CustomPersonViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        if (indexPath.row % 2 == 0)  {
            cell.cofigureLabel(text: persons[indexPath.section].tel)
            cell.configureImage(image: .init(systemName: "phone")) } else {
                cell.cofigureLabel(text: persons[indexPath.section].email)
                cell.configureImage(image: .init(systemName: "envelope")) }
        
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }
}
//MARK: - Extensions Delegate
extension CustomPersonViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! TableHeader
        header.configureLabel(text: "\(persons[section].name)  \(persons[section].lastName)")
        return header
    }
}
