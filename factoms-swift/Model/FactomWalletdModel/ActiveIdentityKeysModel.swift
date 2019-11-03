//
//  ActiveIdentityKeysModel.swift
//  factoms-swift
//
//  Created by Sergey Bushnyak on 08/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ActiveIdentityKeysModel:Mappable {
    
    public var chainId:String = ""
    public var height:Int = 0
    public var keys = [String]()
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        chainId         <- map["chainId"]
        height          <- map["height"]
        keys            <- map["keys"]
    }
    
}
