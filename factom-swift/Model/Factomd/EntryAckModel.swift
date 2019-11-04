//
//  EntryEckModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct EntryAckModel:Mappable {
    
    var committxid:String = ""
    var entryhash:String = ""
    var commitData:CommitData?
    var entryData:EntryData?
    
    public init?(map: Map) {
            
    }
    
   public mutating func mapping(map: Map) {
        committxid      <- map["committxid"]
        entryhash       <- map["entryhash"]
        commitData      <- map["commitdata"]
        entryData       <- map["entrydata"]
    }
}

struct CommitData:Mappable {
    
    var transactionDate:Int64 = 0
    var transactionDateString:String = ""
    var blockDate:Int64 = 0
    var blockDateString:String = ""
    var status:String = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        transactionDate         <- map["transactiondate"]
        transactionDateString   <- map["transactiondatestring"]
        blockDate               <- map["blockdate"]
        blockDateString         <- map["blockdatestring"]
        status                  <- map["status"]
    }
    
}

struct EntryData:Mappable {
    
    var blockDate:Int64 = 0
    var blockDateString:String = ""
    var status:String = ""
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        blockDate           <- map["blockdate"]
        blockDateString     <- map["blockdatestring"]
        status              <- map["status"]
    }
    
}
