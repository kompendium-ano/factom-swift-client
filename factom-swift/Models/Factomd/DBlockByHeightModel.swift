//
//  DBlockByHeightModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DBlockByHeightModel: Mappable {
    
    public var rawData:String = ""
    public var dblock:DBlock?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        rawData     <- map["rawdata"]
        dblock      <- map["dblock"]
    }
}

public struct DBlock:Mappable {
    public var header:DBlockHeader?
    public var dbentries:[DBentries]?
    public var dbhash:String = ""
    public var keymr:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        header      <- map["header"]
        dbentries   <- map["dbentries"]
        dbhash      <- map["dbhash"]
        keymr       <- map["keymr"]
    }
}

public struct DBlockHeader:Mappable {
    var version:Int = 0
    var networkid:Int64 = 0
    var bodymr:String = ""
    var prevkeymr:String = ""
    var prevfullhash:String = ""
    var timestamp:Int64 = 0
    var dbheight:Int = 0
    var blockcount:Int = 0
    var chainid:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        version         <- map["version"]
        networkid       <- map["networkid"]
        bodymr          <- map["bodymr"]
        prevkeymr       <- map["prevkeymr"]
        prevfullhash    <- map["prevfullhash"]
        timestamp       <- map["timestamp"]
        dbheight        <- map["dbheight"]
        blockcount      <- map["blockcount"]
        chainid         <- map["chainid"]
    }
}

public struct DBentries:Mappable {
    
    public var chainid:String = ""
    public var keymr:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        chainid     <- map["chainid"]
        keymr       <- map["keymr"]
    }
}
