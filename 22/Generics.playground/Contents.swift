import Cocoa
//关联类型

struct StackIterator<T>:IteratorProtocol{
    var stack:Stack<T>
    mutating func next() -> T? {
        return stack.pop()
    }
}
struct Stack<Element>:Sequence{
    var items=[Element]();
    
    mutating func push(_ item:Element){
        items.append(item)
    }
    //可以直接push 符合 Sequence协议的数据结构,然后通过where子句约束sequence的类型与Element相同
    mutating func pushAll<S:Sequence>(_ sequence:S) where S.Iterator.Element==Element{
        for item in sequence{
            self.push(item)
        }
    }
    
    mutating func pop()->Element?{
        guard !items.isEmpty else{
            return nil
        }
        return items.removeLast()
    }
    func map<T>(_ f:(Element)->(T)) -> [T] {
        var result = [T]()
        for i in items{
            result.append(f(i))
        }
        return result
    }
    func filter(_ f:(Element)->Bool)->[Element]{
        var result = [Element]()
        for i in items{
            if(f(i)){
                result.append(i)
            }
        }
        return result
    }
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}
var stack=Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
var myStackIterator=StackIterator(stack: stack)
print(stack.filter{$0>1})
while let value = myStackIterator.next(){
    print(value)
}
for value in stack{
    print(value)
}
//范型函数和方法
func mapTo<V,U>(_ items:[V],_ f:(V)->U)->[U]{
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}
func findAll<T:Collection>(_ items:T,equal:T.Element)->[Int] where T.Element:Equatable{
    var result=[Int]()
    for (index,item) in items.enumerated(){
        if(item == equal){
            result.append(index)
        }
    }
    return result
}
print(findAll(["a","b","c"],equal: "c"))
print(findAll([1,2,3,4,5,2],equal: 2))
let values=mapTo([1,2,3]){
    item in
    return "i am \(item)"
}
//类型约束
func checkIfEqual<T:Equatable>(_ a:T,_ b:T)->Bool{
    return a == b
}
checkIfEqual(1, 2)

