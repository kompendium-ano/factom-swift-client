//
//  PendingEntriesModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct PendingEntriesModel:Mappable {
    public var jsonrpc:String = ""
    public var id:Int = 0
    public var entries:[Entries]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        jsonrpc     <- map["jsonrpc"]
        id          <- map["id"]
        entries     <- map["result"]
    }
}

public struct Entries {
    public var entryhash:String = ""
    public var chainid:String = ""
    public var status:String = ""
}
