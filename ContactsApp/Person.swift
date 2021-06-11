struct Person  {
    let name : String
    let lastName : String
    let tel : String
    let email: String
    
    static func getPersons() -> [Person] {
            var persons : [Person] = []
            let count : [Int] = [DataManager.name.count, DataManager.lastName.count, DataManager.tel.count, DataManager.email.count]
            let minCount = count.min() ?? 0
        for _ in 0...(minCount-1) {
            persons.append(Person(name: DataManager.name.removeFirst(), lastName: DataManager.lastName.removeFirst(), tel:DataManager.tel.removeFirst(), email: DataManager.email.removeFirst()))
        }
            return persons
    }
}


