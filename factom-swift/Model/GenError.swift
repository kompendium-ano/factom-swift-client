//
//  GenError.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct GenError:Mappable {
    public var code:Int = 0
    public var message:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        code        <- map["code"]
        message     <- map["message"]
    }
}
