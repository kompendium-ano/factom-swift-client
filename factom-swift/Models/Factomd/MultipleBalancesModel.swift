//
//  MultipleECBalancesModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct MultipleBalancesModel:Mappable {
    
    public var currentHeight:Int = 0
    public var lastSavedHeight:Int = 0
    public var balances:[Balances]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        currentHeight       <- map["currentheight"]
        lastSavedHeight     <- map["lastsavedheight"]
        balances            <- map["balances"]
    }
}

public struct Balances:Mappable {
    
    public var ack:Int = 0
    public var saved:Int = 0
    public var err:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        ack     <- map["ack"]
        saved   <- map["map"]
        err     <- map["err"]
    }
}
