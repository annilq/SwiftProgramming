import Cocoa
//for in 循环
for i in 1...100 where i%3==0{
    print(i)
}

//while 循环
var shields=5 //盾牌
var blasterOverheating=false //爆能枪是否需要冷却
var blasterFireCount=0//开火次数
var spaceDemonsDestoryed=0
while shields>0{
    if(spaceDemonsDestoryed==20){
        print("you win this game")
        break
    }
    if(blasterOverheating){
        print("overheating now,wait to cold")
        sleep(5)
        print("ready to fire")
        sleep(1)
        blasterOverheating=false
        blasterFireCount=0
        continue
    }
    if(blasterFireCount>=5){
        blasterOverheating=true
        continue
    }
    print("Fire blaster")
    blasterFireCount+=1;
    spaceDemonsDestoryed+=1
}

