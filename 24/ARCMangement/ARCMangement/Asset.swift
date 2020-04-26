//
//  Asset.swift
//  ARCMangement
//
//  Created by annilq on 2020/4/25.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation
class Asset: CustomStringConvertible {
    let name:String
    let value:Double
    weak var owner:Person?
    
    var description: String{
        if let person = owner{
            return "Asset \(name) worth \(value) owend by \(person)"
        }else{
            return "Asset \(name) worth \(value) owend by anyone"
        }
    }
    init(name:String,value:Double) {
        self.name=name
        self.value=value
    }
    deinit {
        print("\(self) is being deallocated")
    }
}
