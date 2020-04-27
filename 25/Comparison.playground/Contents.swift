
//
//  Comparsion.swift
//  ARCMangement
//
//  Created by annilq on 2020/4/27.
//  Copyright © 2020 annilq. All rights reserved.
//

import Cocoa

struct Point :Comparable{
    static func < (lhs: Point, rhs: Point) -> Bool {
        return lhs.x<rhs.x&&lhs.y<rhs.y
    }
    
    let x:Int
    let y:Int
}
let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let equal=(a > b)

