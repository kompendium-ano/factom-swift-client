//
//  AuthoritesModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct AuthoritiesModel:Mappable {
    
   public var authorities:[Authorities]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        authorities     <- map["Authorities"]
    }
    
}

public struct Authorities:Mappable {
    
    public var authorityChainId:String = ""
    public var managementChainId:String = ""
    public var matryoshkaHash:String = ""
    public var signingKey:String = ""
    public var status:Bool = false
    public var anchorKeys:[String]?
    public var keyHistory:[String]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        authorityChainId    <- map["AuthorityChainID"]
        managementChainId   <- map["ManagementChainID"]
        matryoshkaHash      <- map["MatryoshkaHash"]
        signingKey          <- map["SigningKey"]
        status              <- map["Status"]
        anchorKeys          <- map["AnchorKeys"]
        keyHistory          <- map["KeyHistory"]
    }
}
