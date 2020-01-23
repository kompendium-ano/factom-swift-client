//
//  FactoidAckModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct FactoidAckModel:Mappable {
    
    public var txid:String = ""
    public var transactionDate:Int64 = 0
    public var transactionDatesString:String = ""
    public var blockDate:Int64 = 0
    public var blockDateString:String = ""
    public var status:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        txid                    <- map["txid"]
        transactionDate         <- map["transactiondate"]
        transactionDatesString  <- map["transactiondatestring"]
        blockDate               <- map["blockdate"]
        blockDateString         <- map["blockdatestring"]
        status                  <- map["status"]
    }
}
