struct Person  {
    let name : String
    let lastName : String
    let tel : String
    let email: String
    
    static func getPersons() -> [Person] {
        var persons : [Person] = []
        var minCount = getMinimumElementsOfAllSequence() // чтобы каждому достались имя, фамилия, телефон и email
        while (minCount != 0) {
            persons.append(Person(name: DataManager.name.removeFirst(), lastName:                                DataManager.lastName.removeFirst(), tel:DataManager.tel.removeFirst(), email: DataManager.email.removeFirst()))
            minCount  -= 1
        }
        return persons
    }
    
}
private func getMinimumElementsOfAllSequence () -> Int {
    let count : [Int] = [DataManager.name.count, DataManager.lastName.count, DataManager.tel.count, DataManager.email.count]
    return count.min() ?? 0
}
