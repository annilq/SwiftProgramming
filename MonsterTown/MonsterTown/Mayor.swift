//
//  Mayor.swift
//  MonsterTown
//
//  Created by annilq on 2020/4/4.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation
struct Mayor {
    private var anxietyLevel = 0{
        didSet(old){
            if(old == 1){
                print("I'm going to die")
            }
        }
    }
    mutating func notify() {
        print("I am deeply saddened to hear about this lastst tragedy")
        self.anxietyLevel = anxietyLevel+1
    }
}
