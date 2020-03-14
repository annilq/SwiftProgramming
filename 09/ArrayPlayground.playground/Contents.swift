import Cocoa

//var bucketList = [String]
var bucketList : Array<String>=[]
//可以利用类型推倒
//var bucketList=[""]
bucketList.count
bucketList.isEmpty
bucketList.append("hello");
bucketList.append("annilq");
bucketList[0...1]
bucketList[1]="hi"
var newNames = ["wu","liu","gao"];
bucketList+=newNames
bucketList.remove(at: 1)
bucketList.insert("lan", at: 1)
