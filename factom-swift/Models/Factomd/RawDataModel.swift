//
//  RawDataModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct RawDataModel:Mappable {
    public var data:String = ""
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        data    <- map["data"]
    }
}
