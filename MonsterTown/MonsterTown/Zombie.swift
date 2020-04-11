//
//  Zombie.swift
//  MonsterTown
//
//  Created by annilq on 2020/4/4.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation

class Zombie: Monster {
    override class var spookNoise: String{
        return "Brains..."
    }
    var walksWithLimp:Bool
    private(set) var isFailingApart:Bool
    init(limp:Bool,fallingApart:Bool,town:Town?,monsterName:String) {
        walksWithLimp=limp
        isFailingApart=fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init(limp:Bool,fallingApart:Bool) {
        self.init(limp:limp,fallingApart:fallingApart,town:nil,monsterName:"Fred")
        if walksWithLimp {
            print("this zombie has a bad knee")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walksWithLimp=false
        isFailingApart=false
        super.init(town: town, monsterName: monsterName)
    }
    
    final override func terrorizeTown() {
        Monster.makeSomeNoise()
        super.terrorizeTown()
        if !isFailingApart {
            town?.changePopulation(by: -10);
        }
    }
}
