//
//  Monster.swift
//  MonsterTown
//
//  Created by annilq on 2020/4/4.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation

class Monster{
    static let isTerrifying = true
    class var spookNoise :String{
        return "Gree"
    }
    var town:Town?
    var name:String
    
   required init(town:Town?,monsterName:String){
        self.town=town
        name=monsterName
    }
    func terrorizeTown() {
        if town != nil{
            print("\(name) is terrorize a town")
        }else{
            print("\(name) has not found a town to terrorize")
        }
    }
    
    class func makeSomeNoise(){
        print("ao!!!!!!!")
    }
}
