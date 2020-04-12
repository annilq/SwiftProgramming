import Cocoa

typealias Velocity = Double
extension Velocity{
    var kph:Velocity{
        return self*1.60934
    }
    var mph:Velocity{
        return self
    }
}
protocol Vehicle {
    var topSpeed:Velocity{get}
    var numberOfDoors:Int { get set }
    var hasFlatbed:Bool{get}
}
struct Car {
    let make :String
    let model :String
    let year :Int
    let color :String
    let nikeName :String
    var numberOfDoors=2
    var gasLevel:Double{
        willSet{
            precondition(newValue<=1.0&&newValue>0.0,"new value must between 0 and 1")
        }
    }
}
extension Car:Vehicle{
    var topSpeed: Velocity{
        return 180
    }
    var hasFlatbed: Bool{
        return false
    }
}

extension Car{
    enum Kind {
        case coupe,sedan
    }
    var kind:Kind{
        if numberOfDoors == 2{
            return .coupe
        }else{
            return .sedan
        }
    }
    mutating func emptyGas(by amount:Double){
        precondition(amount<=1&&amount>0, "Amount to remoe must be between 0 and 1")
        if gasLevel-amount<=0{
            print("we don't have so much gas")
        }else{
            gasLevel -= amount
        }
    }
    mutating func fillGas(){
        gasLevel=1
    }
    init(make:String,model:String,year:Int) {
        self.init(make:make,model:model,year:year,color:"black",nikeName:"N/A",gasLevel:1.0)
    }
}
var c = Car(make: "Ford", model: "Fusion", year: 2013)
c.kind
c.emptyGas(by: 0.3)
c.gasLevel
c.emptyGas(by: 0.8)
c.gasLevel
c.fillGas()
c.gasLevel
c.numberOfDoors=3
c.kind
