import Cocoa

//var ageDictionary : [String:Int]=[:]
//var ageDictionary = [String:Int]()
var ageDictionary = Dictionary<String,Int>()
ageDictionary["wu"] = 33
ageDictionary["liu"] = 32
ageDictionary["chen"] = 3
ageDictionary["xi"] = 1
ageDictionary.removeValue(forKey: "liu")
let names=Array(ageDictionary.keys)

var citysOfprivice:[String:[Int]]=[:]
citysOfprivice["tieling"]=[1,2,3]
citysOfprivice["shenyang"]=[4,5,6]
var string="the following city are ["
for (i,value) in citysOfprivice{
    print("\(i) has these code \(value)")
}
