import Cocoa

var str :String? = "Hello, playground"

if str != nil{
    print(str!)
}
//可空实例绑定成功之后会将变量实例展开赋值，后续不需要再展开了
if let value=str{
    print(value)
}
//隐式展开可空类型，使用时一定不能为空，不然会报错
var test:String!
//nil合并运算符
let aa:String? = nil
var bb = aa ?? "hha"
