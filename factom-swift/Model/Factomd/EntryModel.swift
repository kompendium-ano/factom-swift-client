//
//  EntryModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct EntryModel:Mappable {
    
    public var chainid:String = ""
    public var content:String = ""
    public var extids = [String]()
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        chainid     <- map["chainid"]
        content     <- map["content"]
        extids      <- map["extids"]
    }
    
}
