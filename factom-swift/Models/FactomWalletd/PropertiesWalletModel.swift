//
//  PropertiesWalletModel.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct PropertiesWalletModel:Mappable {
    
    public var walletVersion:String = ""
    public var walletApiVersion:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        walletVersion  <- map["walletversion"]
        walletApiVersion  <- map["walletapiversion"]
    }
}
