//
//  NetworkInfoModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct NetworkInfoModel:Mappable {
    
    public var networkNumber:Int = 0
    public var networkName:String = ""
    public var networkId:Int64 = 0
    
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        networkName     <- map["NetworkName"]
        networkId       <- map["NetworkID"]
        networkNumber   <- map["NetworkNumber"]
    }
}
