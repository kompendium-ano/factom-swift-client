//
//  CurrentMinuteModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 11/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct CurrentMinuteModel:Mappable {
   
    public var leaderHeight:Int = 0
    public var directoryBlockHeight:Int = 0
    public var minute:Int = 0
    public var currentBlockStartTime:Int64 = 0
    public var currentMinutesStartTime:Int64 = 0
    public var currentTime:Int64 = 0
    public var directoryBlockInSeconds:Int = 0
    public var stallDetected:Bool = false
    public var faultTimeOut:Int = 0
    public var roundTimeOut:Int = 0
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        leaderHeight            <- map["leaderheight"]
        directoryBlockHeight    <- map["directoryblockstarttime"]
        minute                  <- map["minute"]
        currentBlockStartTime   <- map["currentblockstarttime"]
        currentMinutesStartTime <- map["currentminutestarttime"]
        currentTime             <- map["currenttime"]
        directoryBlockInSeconds <- map["directoryblockinseconds"]
        stallDetected           <- map["stalldetected"]
        faultTimeOut            <- map["faulttimeout"]
        roundTimeOut            <- map["roundtimeout"]
    }
    
}
