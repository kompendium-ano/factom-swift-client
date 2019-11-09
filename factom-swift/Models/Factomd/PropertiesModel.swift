//
//  PropertiesModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct PropertiesModel:Mappable {
    public var factomdversion:String = ""
    public var factomdapiversion:String = ""
    
    public init?(map: Map) {
        
    }
    
   public mutating func mapping(map: Map) {
        factomdversion      <- map["factomdversion"]
        factomdapiversion   <- map["factomdapiversion"]
    }
}
