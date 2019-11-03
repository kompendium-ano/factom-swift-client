//
//  DirectoryBlockModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DirectoryBlockModel:Mappable {
    
    var header:DirectoryHeader?
    var entryBlockList:[DBentries]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        header          <- map["header"]
        entryBlockList  <- map["entryblocklist"]
        
    }
}

public struct DirectoryHeader:Mappable {
    var prevblockkeymr:String = ""
    var sequencenumber:Int = 0
    var timestamp:Int64 = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        prevblockkeymr      <- map["prevblockkeymr"]
        sequencenumber      <- map["sequencenumber"]
        timestamp           <- map["timestamp"]
    }
}
