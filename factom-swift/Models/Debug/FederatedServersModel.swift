//
//  AuditServersModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct FederatedServersModel:Mappable {
    
    public var federatedServers:[FederatedServer]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        federatedServers        <- map["FederatedServers"]
    }
}

public struct FederatedServer:Mappable {
    
    public var chainId:String = ""
    public var name:String = ""
    public var online:Bool = false
    public var replace:String?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        chainId     <- map["ChainID"]
        name        <- map["Name"]
        online      <- map["Online"]
        replace     <- map["Replace"]
    }
    
}
