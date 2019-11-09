//
//  EntryBlockModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct EntryBlockModel:Mappable {
    
    public var header:EntryBlockHeader?
    public var entryList:[EntryList]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        header      <- map["header"]
        entryList   <- map["entrylist"]
    }
}

public struct EntryBlockHeader:Mappable {
    
    public var blockSequenceNumber:Int = 0
    public var chainId:String = ""
    public var prevKeymr:String = ""
    public var timestamp:Int64 = 0
    public var dbheight:Int = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        blockSequenceNumber     <- map["blocksequencenumber"]
        chainId                 <- map["chainid"]
        prevKeymr               <- map["prevkeymr"]
        timestamp               <- map["timestamp"]
        dbheight                <- map["dbheight"]
    }
}

public struct EntryList:Mappable {
    
    public var entryhash:String = ""
    public var timestamp:Int64 = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        entryhash   <- map["entryhash"]
        timestamp   <- map["timestamp"]
    }
    
}
