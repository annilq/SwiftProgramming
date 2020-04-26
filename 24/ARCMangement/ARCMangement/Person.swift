//
//  Person.swift
//  ARCMangement
//
//  Created by annilq on 2020/4/25.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation
class Person:CustomStringConvertible {
    let name:String
    var accountant = Accountant()
    var assets=[Asset]()
    var description:String{
        return "Person \(name)"
    }
    init(name:String) {
        self.name=name
        //        accountant.netWorthChangedHandle={
        //            //捕获列表
        //           [weak self] netWorth in
        //            self?.netWorthDidChange(to:netWorth)
        //        }
    }
    func takeOwnerShip(of asset:Asset) {
        
        accountant.gained(asset){
            netWorth in
            asset.owner=self
            assets.append(asset)
            //             print("the net worth of \(self) is changed to \(netWorth)")
        }
    }
    //    func netWorthDidChange(to netWorth:Double){
    //        print("the net worth of \(self) is changed to \(netWorth)")
    //    }
    
    func useNetWorthChangedHandle(handle:@escaping (Double)->Void) {
        accountant.netWorthChangedHandle=handle
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}
