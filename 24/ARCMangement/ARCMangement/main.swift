//
//  main.swift
//  ARCMangement
//
//  Created by annilq on 2020/4/25.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation

var bob:Person? = Person(name: "blob")
var laptop:Asset? = Asset(name: "shiny Laptop", value: 1500.0)
var hat:Asset? = Asset(name: "bowboy Hat", value: 100.0)
var backpack:Asset? = Asset(name: "blue Backpack", value: 45.0)
bob?.useNetWorthChangedHandle{
    netWorth in
    print("Bob's net worth is changed to \(netWorth)")
}
bob?.takeOwnerShip(of: laptop!)
bob?.takeOwnerShip(of: hat!)
bob?.takeOwnerShip(of: backpack!)
laptop=nil
hat=nil
backpack=nil
bob=nil
