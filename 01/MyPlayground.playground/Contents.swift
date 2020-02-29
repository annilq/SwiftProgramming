//熟悉变量初始化以及占位符和if条件控制
//变量使用之前一定要初始化
import Cocoa

var str :String
let hometown = "liaoning"
var population = 512
var unemploymentRate=0.1
func greeting(name:String,population:Int){
    print("a homwtown named \(name) has \(population) people and the unemploymentRate is \(unemploymentRate)")
}

if population>100{
    print("\(hometown) is a big city")
}else{
    print("\(hometown) is a small city")

}

greeting(name: hometown, population: population);
