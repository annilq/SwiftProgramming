import Cocoa

enum Shape{
    case square(side:Double)
    case rectanagle(width:Double,height:Double)
    case ponit
    func area()->Double {
        switch self {
        //值绑定把side的值绑定的参数squareside上
        case let .square(side: squareside):
            return squareside * squareside
        case let .rectanagle(width: rectwidth, height: rectheight):
            return rectwidth * rectheight
        case .ponit:
            return 0
        }
    }
    func perimter() -> Double {
        switch self {
        case let .square(side: side):
            return side*4
        case let .rectanagle(width: width, height: height):
            return (width+height)*2
        case .ponit:
            return 0
        }
    }
}
var square:Shape = .square(side: 10);
var rect:Shape = .rectanagle(width: 10, height: 20);
var ponit:Shape = .ponit;
square.area()
rect.area()
ponit.area()
square.perimter()
rect.perimter()
ponit.perimter()
