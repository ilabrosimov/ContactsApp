class Person : DataManager  {
    let name : String
    let lastName : String
    let tel : String
    let email: String
    override init() {
        self.name = DataManager.name.removeFirst()
        self.lastName = DataManager.lastName.removeFirst()
        self.tel = DataManager.tel.removeFirst()
        self.email = DataManager.email.removeFirst()
    }
    static func getPersons() -> [Person] {
            var persons : [Person] = []
            let countElements : [Int] = [DataManager.name.count, DataManager.lastName.count, DataManager.tel.count, DataManager.email.count]
        
            let minCount = countElements.min() ?? 0
            for _ in 0...(minCount-1) {
            persons.append(Person())
        }
            return persons
    }
}


