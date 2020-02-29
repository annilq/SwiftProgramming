//switch语句常用使用方法，会涉及到区间以及值绑定
import Cocoa

var statusCode = 355
var errorMessage:String
switch statusCode {
case 300...399:
    errorMessage="unauthorized";
//    如果分支末尾有fallthrough状态转移语句的话回首先执行自己的代码，在把控制权交给下面紧挨着的分支，无论检验的是否配都会执行,用处不大，可能还会造成错误
//    fallthrough
case 400,401,402,403:
    errorMessage="bad request";
case 404:
    errorMessage="not found";
case let unknowCode where (unknowCode>=200&&unknowCode<300)||unknowCode>500:
//    值绑定 ,值绑定的时候可以使用where子句过滤不需要的数据
    errorMessage="unkown error";
default:
    errorMessage="unexpect error happen"
}

//let error=(statusCode,errorMessage)
//print(error.0)
let error=(statusCode:statusCode,errorMessage:errorMessage)
print(error.statusCode)


//用元祖做模式匹配
let firstCode = 355
let secondCode = 404

var statusCodeTuple = (firstCode,secondCode)

switch statusCodeTuple {
case (404,404):
    print("all not find")
case (404,_):
// _为模式匹配通配符，可以匹配任何值，但是我还不了解通配符
    print("first not find")
case (_,404):
    print("second find")
default:
    print("all find")
}

//if case语句适用于只有一个分支的switch语句，并且可以使用模式匹配
let age=32
let married=true
if case 10...35=age,married{
 print("I am a old man")
}
