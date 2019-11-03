//
//  ComposeChainModel.swift
//  factoms-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ComposeModel:Mappable {
    
    public var commit:Commit?
    public var reveal:Reveal?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        commit      <- map["commit"]
        reveal      <- map["reveal"]
    }
}

public struct Commit:Mappable {
    
    public var jsonrpc:String = ""
    public var id:Int = 0
    public var params:JSONObject?
    public var method:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        jsonrpc     <- map["jsonrpc"]
        id          <- map["id"]
        params      <- map["params"]
        method      <- map["method"]
    }
}

public struct Reveal:Mappable {
    
    public var jsonrpc:String = ""
    public var id:Int = 0
    public var params:JSONObject?
    public var method:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        jsonrpc     <- map["jsonrpc"]
        id          <- map["id"]
        params      <- map["params"]
        method      <- map["method"]
    }
}
