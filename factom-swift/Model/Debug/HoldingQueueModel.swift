//
//  HoldingQueueModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct HoldingQueueModel:Mappable {
    public var messages:[String]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        messages    <- map["Messages"]
    }
}
