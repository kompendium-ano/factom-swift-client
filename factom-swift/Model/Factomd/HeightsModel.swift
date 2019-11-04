//
//  HeightsModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct HeightsModel:Mappable {
    
    public var directoryBlockHeight:Int64 = 0
    public var leaderHeight:Int64 = 0
    public var entryBlockHeight:Int = 0
    public var entryHeight:Int = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        directoryBlockHeight    <- map["directoryblockheight"]
        leaderHeight            <- map["leaderheight"]
        entryBlockHeight        <- map["entryblockheight"]
        entryHeight             <- map["entryheight"]
    }
}
