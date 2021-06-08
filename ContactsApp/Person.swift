struct Person  {
    let name : String
    let lastName : String
    let tel : String
    let email: String
    static func getPerson() -> [Person] {
        var persons : [Person] = []
        let dataManager = DataManager()
        persons.append(Person.init(name: dataManager.name[0] , lastName: dataManager.lastName[0], tel: dataManager.tel[0], email: dataManager.email[0]))
        return persons
    }
}
