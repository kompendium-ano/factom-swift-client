//
//  DirectoryBlockHeadModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DirectoryBlockHeadModel:Mappable {
    
    public var keymr:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        keymr       <- map["keymr"]
    }
    
    
}
