import Cocoa

let numbers=[1,2,5,3,7,4,10]
let sort1=numbers.sorted(by: {(a:Int,b:Int)->Bool in a<b})
//简写 省略类型
let sort2=numbers.sorted(by: {a,b in a<b})
//快捷参数
let sort3=numbers.sorted(by: {$0<$1})

//尾部闭包语法
//如果一个闭包是以一个函数的最后一个参数传递的则可以在函数的圆括号外内连
let sort4=numbers.sorted{$0<$1}
let total=numbers.reduce(0){$0+$1}

//函数作为返回值
func makeTownGrand(withBudget budget:Int,condition:(Int)->Bool)->((Int,Int)->Int)?{
    if condition(budget){
        func buildRoad(byAddingLights light: Int,toExistingLights:Int)->Int{
            return light+toExistingLights
        }
        return buildRoad
    }
    return nil
}
func evalutate(budget:Int)->Bool{
    return budget>10000
}

var stoplights=4

if let townPlanlights=makeTownGrand(withBudget: 1000, condition: evalutate){
    stoplights=townPlanlights(4,stoplights)
}
//练习
