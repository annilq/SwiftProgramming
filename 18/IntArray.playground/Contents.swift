import Cocoa

fileprivate class IntArrayBuffer{
    var storage:[Int]
    
    init() {
        storage=[]
    }
    init(buffer : IntArrayBuffer) {
        storage=buffer.storage
    }
}

struct IntArray{
    private var buffer:IntArrayBuffer
    
    init() {
        buffer = IntArrayBuffer()
    }
    mutating func insert(_ value:Int,at index:Int) {
        copyIfNeeded()
        buffer.storage.insert(value, at: index)
    }
    mutating func append(_ value:Int) {
        copyIfNeeded()
        buffer.storage.append(value)
    }
    mutating func remove(at index:Int) {
        copyIfNeeded()
        buffer.storage.remove(at:index)
    }
    
    private mutating func copyIfNeeded(){
        if !isKnownUniquelyReferenced(&buffer){
            print("Making a copy of \(buffer.storage)")
            buffer = IntArrayBuffer(buffer: buffer)
        }
    }
    func describe() {
        print(buffer.storage)
    }
}
var integers = IntArray()
integers.append(1)
integers.append(2)
integers.append(4)
integers.describe()
var ints=integers
ints.insert(3, at: 2)
integers.describe()
ints.describe()
