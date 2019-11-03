//
//  ResponseModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ResponseModel:Mappable {
    
    public var jsonrpc:String = ""
    public var id:Int?
    public var result:JSONObject?
    public var error:ErrorModel?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        jsonrpc     <- map["jsonrpc"]
        id          <- map["id"]
        result      <- map["result"]
        error       <- map["error"]
    }
}
