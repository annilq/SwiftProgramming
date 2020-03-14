import Cocoa
//Set是一组键不相同的无序集合
//  字面量
var parentSet:Set=["annilq","wu"]
parentSet.insert("gao")
var childrenSet:Set=["chen","xi","annilq"]
childrenSet.insert("wu")
//初始化方法
//var parentSet=Set<String>()
//  初始化方法设置默认值
//var parentSet=Set(["annilq","wu"])
let name=parentSet.contains("wu");
let allPeople=parentSet.union(childrenSet)
let bothChildAndParent=parentSet.intersection(childrenSet)
