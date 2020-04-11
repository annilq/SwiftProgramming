//
//  Vampire.swift
//  MonsterTown
//
//  Created by annilq on 2020/4/4.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation

class Vampire: Monster {
    var thrall = [String]()
    override func terrorizeTown() {
        thrall.append("thall")
        town?.changePopulation(by: -1)
        super.terrorizeTown()
    }
}
