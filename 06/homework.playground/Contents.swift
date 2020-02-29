import Cocoa

//练习
for i in 1...20 {
    let mode3=i%3==0
    let mode5=i%5==0
    let result=(mode3,mode5);
    switch result {
    case (true,true):
        print("Fizz Buzz")
    case (false,true):
        print("Fizz")
    case (true,false):
        print("Buzz")
    default:
        print(i)
    }
}
