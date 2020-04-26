//
//  accountant.swift
//  ARCMangement
//
//  Created by annilq on 2020/4/25.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation
class Accountant {
    typealias NetWorthChanged = (Double)->Void
    var netWorthChangedHandle :NetWorthChanged?=nil
    var netWorth:Double=0.0{
        didSet{
            netWorthChangedHandle?(netWorth)
        }
    }
    func gained(_ asset:Asset,complecation:(_ :Double)->Void){
        netWorth += asset.value
        complecation(netWorth)
    }
}
