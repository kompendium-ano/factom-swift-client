//
//  ChainHeadModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ChainHeadModel: Mappable {
    
    public var chainHead:String = ""
    public var chainInProcessList:Bool = false
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        chainHead           <- map["chainhead"]
        chainInProcessList  <- map["chaininprocesslist"]
    }
}
