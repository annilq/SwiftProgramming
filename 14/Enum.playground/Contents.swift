import Cocoa

enum Lightbulb:String{
    case on
    case off
    func turnUp() {
        switch self {
        case .on:
            print("on")
        case .off:
            print("call off")
        }
        
    }
}
var bulb:Lightbulb
bulb = .on
switch bulb {
case .on:
print("on")
case .off:
print("off")
default:
    print("no match")
}
print(Lightbulb.on.rawValue);
let off="off"
if let off = Lightbulb(rawValue: off){
    off.turnUp()
}
