//
//  ABlockByHeightModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ABlockByHeightModel:Mappable {
    
    public var ablock:ABlock?
    public var rawData:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        ablock      <- map["ablock"]
        rawData     <- map["rawdata"]
    }
    
}

public struct ABlock {
    
    public var header:Header?
    public var abentries:[Abentries]?
    public var backreferencehash:String = ""
    public var lookuphash:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        header                  <- map["header"]
        abentries               <- map["abentries"]
        backreferencehash       <- map["backreferencehash"]
        lookuphash              <- map["lookuphash"]
    }
}

public struct Header {
    public var prevBackRefHash:String = ""
    public var dbHeight:Int = 0
    public var headerExpansionSize:Int = 0
    public var headerExpansionArea:Int?
    public var messageCount:Int = 0
    public var bodySize:Int = 0
    public var adminChainId:String = ""
    public var chainId:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        prevBackRefHash             <- map["prevbackrefhash"]
        dbHeight                    <- map["dbheight"]
        headerExpansionSize         <- map["headerexpansionsize"]
        headerExpansionArea         <- map["headerexpansionarea"]
        messageCount                <- map["messagecount"]
        bodySize                    <- map["bodysize"]
        adminChainId                <- map["adminchainid"]
        chainId                     <- map["chainid"]
    }
}

public struct Abentries {
    public var identityadminchainid:String = ""
    public var prevdbsig:Prevdbsig?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        identityadminchainid        <- map["identityadminchainid"]
        prevdbsig                   <- map["prevdbsig"]
    }
}

public struct Prevdbsig {
    public var pub = ""
    public var sig = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        pub     <- map["pub"]
        sig     <- map["sig"]
    }
}
