//
//  WalletBackupModel.swift
//  factoms-swift
//
//  Created by Sergey Bushnyak on 02/12/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct WalletBackupModel:Mappable {
    
    public var walletSeed:String = ""
    public var addresses:[AddressModel]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        walletSeed   <- map["wallet-seed"]
        addresses   <- map["addresses"]
    }
}
