
import Cocoa
func printGreeting(name:String){
    print("hello \(name)")
}
printGreeting(name: "annilq")
//拥有相同外部参数名字的函数是相同的函数

//func printGreeting(name person:String){
//    print("hello\(person)")
//}

func printGreeting(person name:String){
    print("hello \(name)")
}
printGreeting(person: "annilq")
//省略参数名
func printGreeting(_ name:String){
    print("hello \(name)")
}
printGreeting( "annilq")


//变长参数
func printgreetings(to: String...){
    for name in to{
        print(name)
    }
}
printgreetings(to:"annilq","wu","xi")

//默认参数
func printTo(name:String,withGreeting words:String = "hello"){
    print("\(words) \(name)")
}
printTo(name: "annilq", withGreeting: "hi")
printTo(name: "annilq")

//in-out参数
var errorMessage="the request faild";
func appendErrorCode(_ code:Int,message:inout String){
    if case 400...500 = code{
        message+="error encountered"
    }
}
appendErrorCode(400, message: &errorMessage)
errorMessage


//多个返回值
func sordedEvenOldNumbers(_ numbers:Int...)->(even:[Int],odd:[Int]){
    var even=[Int]();
    var odd=[Int]();
    for i in numbers{
        if i%2 == 0{
            even.append(i)
        }else{
            odd.append(i)
        }
    }
    return (even,odd)
}
sordedEvenOldNumbers(1,3,4,5,6,7);


//提前退出函数(青铜挑战)
//if 中的where子句可以替换成逗号，switch中的where子句还不能替换
func greetByMiddleName(first:String,middle:String,last:String?){
    guard let lastName = last , lastName.hasSuffix("yo") else{
        print("you know")
        return
    }
    print("\(first) \(middle) \(lastName)")
}
greetByMiddleName(first: "hello", middle: "hhha", last: "y")

//白银挑战
func siftBeans(fromGroceryList:[String])->(beans:[String],others:[String]){
    var beans=[String]()
    var others=[String]()
    for thing in fromGroceryList{
        if thing.hasSuffix("bean"){
            beans.append(thing)
        }else{
            others.append(thing)
        }
    }
    
    return (beans,others)
}
let foods=["aa bean","bb bean","cc","dd"]
let result=siftBeans(fromGroceryList: foods)
result.beans
