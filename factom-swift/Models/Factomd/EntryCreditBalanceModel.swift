//
//  EntryCreditBalanceModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct EntryCreditBalanceModel:Mappable {
    
    public var balance:Int = 0
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        balance <- map["balance"]
    }
}
