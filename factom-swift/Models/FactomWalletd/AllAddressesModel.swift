//
//  AllAddressesModel.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct AllAddressesModel: Mappable {
    
    public var addresses:[AddressModel]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        addresses   <- map["addresses"]
    }
    
}
