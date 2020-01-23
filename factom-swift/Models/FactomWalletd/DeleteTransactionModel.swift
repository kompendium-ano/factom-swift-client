//
//  DeleteTransactionModel.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DeleteTransactionModel:Mappable {
    
    public var signed:Bool = false
    public var name:String = ""
    public var timestamp:Int64 = 0
    public var totalEcOutputs:Int = 0
    public var totalInputs:Int = 0
    public var totalOutputs:Int = 0
    public var inputs:[Inputs]?
    public var outputs:[Inputs]?
    public var ecoutputs:[Inputs]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        signed          <- map["signed"]
        name            <- map["name"]
        timestamp       <- map["timestamp"]
        totalEcOutputs  <- map["totalecoutputs"]
        totalInputs     <- map["totalinputs"]
        totalOutputs    <- map["totaloutputs"]
        inputs          <- map["inputs"]
        outputs         <- map["outputs"]
        ecoutputs       <- map["ecoutputs"]
    }
    
}
