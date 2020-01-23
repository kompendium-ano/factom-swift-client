//
//  ComposeTransactionModel.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ComposeTransactionModel:Mappable {
    
    public var jsonrpc:String = ""
    public var id:Int = 0
    public var params:JSONObject?
    public var method:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        jsonrpc     <- map["jsonrpc"]
        id          <- map["id"]
        params      <- map["params"]
        method      <- map["method"]
    }
}
