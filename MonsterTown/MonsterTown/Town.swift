//
//  Towm.swift
//  MonsterTown
//
//  Created by annilq on 2020/3/28.
//  Copyright © 2020 annilq. All rights reserved.
//

import Foundation

struct Town {
    let region:String
    var numberOfStoplights:Int
    var mayor = Mayor()
    var population :Int{
        didSet(old){
            print("the population has chaned from \(old) to \(population)")
            if(old>population){
                mayor.notify()
            }
            
        }
    }
    
    init(region:String,population:Int,stopLights:Int){
        self.region=region
        self.population=population
        self.numberOfStoplights=stopLights
    }
    init(population:Int,stopLights:Int) {
        self.init(region:"N/A",population:population,stopLights:stopLights)
    }
    enum Size {
        case small
        case medium
        case large
    }
//    如果属性population值是后面设置的则需要惰性储存属性设置
//    个人觉得还不如方法
    lazy var townSize:Size = {
        switch self.population {
        case 0...10000:
            return .small
        case 10000...100000:
            return .medium
        case 100000...1000000:
            return .large
        default:
            return .large
        }
    }();
    
    
    mutating func changePopulation(by amount:Int) {
        population+=amount
        if population<0 {
            population=0;
        }
    }
    
    mutating func description() {
        print("the town is a \(self.townSize) town and has \(population) population and \(numberOfStoplights) stoplights")
    }
//    计算属性
    //     var townSize:Size  {
    //        switch population {
    //        case 0...10000:
    //            return .small
    //        case 10000...100000:
    //            return .medium
    //        case 100000...1000000:
    //            return .large
    //        default:
    //            return .large
    //        }
    //    };
    //     func description() {
    //        print("the town is a \(townSize) town and has \(population) population and \(numberOfStoplights) stoplights")
    //    }
}
