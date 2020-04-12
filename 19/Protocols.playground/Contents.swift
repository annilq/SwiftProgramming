import Cocoa

protocol TablePrintable {
    var numbersOfRows:Int{get}
    var numbersOfCols:Int{get}
    func label(forCol col:Int) -> String
    func itemFor(row:Int,col:Int)->String
}

func printTable(_ dataSource : TablePrintable){
    var firstRow = "|"
    var columnWidths = [Int]()
    for i in 0..<dataSource.numbersOfCols{
        let label = dataSource.label(forCol: i)
        firstRow+="\(label) |"
        columnWidths.append(label.count)
    }
    print(firstRow)
    
    for i in 0..<dataSource.numbersOfRows{
        var out = "|"
        
        for j in 0..<dataSource.numbersOfCols{
            let item = dataSource.itemFor(row: i, col: j)
            let paddingNeeded = columnWidths[j] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out+="\(padding)\(item) |"
        }
        print(out)
        
    }
}

struct Person{
    let name :String
    let personCount :Int
    let position :String
}
struct Department:TablePrintable {
    let name :String
    var people = [Person]()
    
    init(name:String) {
        self.name = name
    }
    init(name:String, people:[Person]) {
        self.name = name
        self.people = people
    }
    mutating func add(_ person :Person){
        people.append(person)
    }
    var numbersOfCols: Int{
        return 3
    }
    var numbersOfRows: Int{
        return people.count
    }
    
    func label(forCol col: Int) -> String {
        let person:Person!
        
        var paddingNeeded:Int
        switch col {
        case 0:
            person = people.max{
                prePerson, nextPerson in
                return prePerson.name.count<nextPerson.name.count
            }
            paddingNeeded =  person.name.count-4
            let padding = repeatElement(" ", count: paddingNeeded>0 ? paddingNeeded:0).joined(separator: "")
            return"\(padding)name"
        case 1:
            person = people.max{
                prePerson, nextPerson in
                return prePerson.personCount<nextPerson.personCount            }
            paddingNeeded =  String(person.personCount).count-10
            let padding = repeatElement(" ", count: paddingNeeded>0 ? paddingNeeded:0).joined(separator: "")
            return"\(padding)personCount"
        case 2:
            person = people.max{
                prePerson, nextPerson in
                return prePerson.position.count<nextPerson.position.count
            }
            paddingNeeded =  person.position.count-8
            let padding = repeatElement(" ", count: paddingNeeded>0 ? paddingNeeded:0).joined(separator: "")
            return"\(padding)position"
        default:fatalError("error")
        }
    }
    func itemFor(row: Int, col: Int) -> String {
        let person =  people[row]
        switch col {
        case 0:
            return person.name
        case 1:
            return String(person.personCount)
        case 2:
            return person.position
        default:fatalError("error")
        }
    }
}
let datas=[Person(name: "mayday", personCount: 5, position: "taiwan"),Person(name: "she", personCount: 3, position: "honkong")]
let depetment=Department(name: "singers", people: datas)
printTable(depetment)
