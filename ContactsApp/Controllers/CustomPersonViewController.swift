
import UIKit



class CustomPersonViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    var persons : [Person] = []
    private let personsTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return tableView
    }()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! TableHeader
        header.configureLabel(text: "\(persons[section].name)  \(persons[section].lastName)")
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

