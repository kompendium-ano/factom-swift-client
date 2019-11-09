//
//  TmpTransactionsModel.swift
//  factoms-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TmpTransactionsModel: Mappable {
    
    public var transactions:[AddressModel]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        transactions   <- map["transactions"]
    }
    
}

public struct Transactions:Mappable {
    
    public var txName:String = ""
    public var txid:String = ""
    public var totalinputs:Int = 0
    public var totaloutputs:Int = 0
    public var totalecoutputs:Int = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        txName   <- map["tx-name"]
        txid   <- map["txid"]
        totalinputs   <- map["totalinputs"]
        totaloutputs   <- map["totaloutputs"]
        totalecoutputs   <- map["totalecoutputs"]
    }
}
