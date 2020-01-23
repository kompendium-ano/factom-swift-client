//
//  AddressModel.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct AddressModel:Mappable {
    
    public var publicKey:String = ""
    public var secretKey:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        publicKey   <- map["public"]
        secretKey   <- map["secret"]
    }
}
