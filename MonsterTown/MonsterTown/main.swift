//
//  main.swift
//  MonsterTown
//
//  Created by annilq on 2020/3/22.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation

print("Hello, World!")

var myTown = Town(region: "South", population: 1000, stopLights: 4)
myTown.changePopulation(by: 1000);
myTown.description()

let zombie = Zombie(limp: true, fallingApart: false, town: myTown, monsterName: "Zombie")
let convenientZombie = Zombie(limp: true, fallingApart: false)
convenientZombie.terrorizeTown()
zombie.terrorizeTown()
zombie.terrorizeTown()
