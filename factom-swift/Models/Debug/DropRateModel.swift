//
//  DropRateModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 13/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DropRateModel:Mappable {
    
    public var dropRate:Int = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        dropRate    <- map["DropRate"]
    }
}
