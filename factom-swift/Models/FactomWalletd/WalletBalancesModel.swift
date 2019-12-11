//
//  WalletBalancesModel.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct WalletBalancesModel:Mappable {
    
    public var fctaccountbalances:WalletBalances?
    public var ecaccountbalances:WalletBalances?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        fctaccountbalances   <- map["fctaccountbalances"]
        ecaccountbalances   <- map["ecaccountbalances"]
    }
}

public struct WalletBalances:Mappable {
    public var ack:Int64 = 0
    public var saved:Int64 = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        ack         <- map["ack"]
        saved       <- map["saved"]
    }
}
