//
//  NewTransactionModel.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct NewTransactionModel:Mappable {
    
    public var feesRequired:Int = 0
    public var signed:Bool = false
    public var name:String = ""
    public var timeStamp:Int = 0
    public var totalEcOutputs:Int = 0
    public var totalInputs:Int64 = 0
    public var totalOutputs:Int64 = 0
    public var inputs:[Inputs]?
    public var outputs:[Inputs]?
    public var ecOutputs:[Inputs]?
    public var txid:String = ""
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        feesRequired        <- map["feesrequired"]
        signed              <- map["signed"]
        name                <- map["name"]
        timeStamp           <- map["timestamp"]
        totalInputs         <- map["totalinputs"]
        totalOutputs        <- map["totaloutputs"]
        inputs              <- map["inputs"]
        outputs             <- map["outputs"]
        ecOutputs           <- map["ecoutputs"]
        txid                <- map["txid"]
    }
}
