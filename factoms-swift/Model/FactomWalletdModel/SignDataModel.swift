//
//  SignDataModel.swift
//  factoms-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct SignDataModel:Mappable {
    
    public var pubkey:String = ""
    public var signature:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        pubkey  <- map["pubkey"]
        signature  <- map["signature"]
    }
}
