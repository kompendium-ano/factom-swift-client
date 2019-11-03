//
//  DelayModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 13/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DelayModel:Mappable {
    
    public var delay:Int = 0
    
    public init?(map: Map) {
        
    }

    public mutating func mapping(map: Map) {
        delay   <- map["Delay"]
    }
}
