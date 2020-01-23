//
//  ConfigurationModel.swift
//  FactomApiTest
//
//  Created by Sergey Bushnyak on 12/11/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ConfigurationModel:Mappable {
    public var app:App?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        
    }
    
}

public struct App {
    public var portNumber:Int = 0
    public var homeDire:String = ""
    public var controlPanelPort:String = ""
    public var controlPanelFilesPath:String = ""
    public var controlPanelSetting:String = ""
    public var dbType:String = ""
    public var ldbPath:String = ""
    public var boltDBPath:String = ""
    public var dataStorePath:String = ""
    public var directoryBlockInSeconds:String = ""
    public var exportData:Bool = false
    public var exportDataSubpath:String = ""
    public var nodeMode:String = ""
    public var identityChainId:String = ""
    public var localServerPrivkey:String = ""
    public var localServerPublickey:String = ""
    public var exchangeRate:Int = 0
    public var exchangeRateChainId:String = ""
    public var exchangeRateAuthorityPublickey:String = ""
    public var exchangeRateAuthorPublicKeyMainNet:String = ""
    public var exchangeRateAuthorityPublicKeyTestNet:String = ""
    public var network:String = ""
    public var mainNetworkPort:String = ""
    public var peersFile:String = ""
    public var mainSeedUrl:String = ""
    public var mainSpecialUrl:String = ""
    public var mainSpecialPeers:String = ""
    public var testNetworkPort:String = ""
    public var testSeedUrl:String = ""
    public var testSpecialPeers:String = ""
    public var localNetworkPort:String = ""
    public var localSeedUrl:String = ""
    public var localSpecialPeers:String = ""
    public var customBootstrapIdentity:String = ""
    public var customBootstrapkey:String = ""
    public var factomdTlsEnabled:String = ""
    public var factomdTlsPrivateKey:String = ""
    public var factomdTlsPublicCert:String = ""
    public var factomdRpcUser:String = ""
    public var factomRpcPass:String = ""
    public var changeAcksHeight:String = ""
    
}

public struct Peers {
    var addPeers:[String]?
    var connectPeers:[String]?
    var listeners:[String]?
    var maxPeers:Int = 0
    var banDuration:Int = 0
    var testNet:Bool = false
    var simNet:Bool = false
}

public struct Log {
    public var logPath:String = ""
    public var logLevel:String = ""
    public var consoleLogLevel:String = ""
}

public struct Wallet {
    public var address:String = ""
    public var port:Int = 0
    public var dataFile:String = ""
    public var refreshInSeconds:String = ""
    public var boltDBPath:String = ""
    public var factomdAddress:String = ""
    public var factomdPort:Int = 0
}

public struct Walletd {
    public var walletRpcUser:String = ""
    public var walletRpcPass:String = ""
    public var walletTlsEnabled:Bool = false
    public var walletTlsPrivateKey:String = ""
    public var walletTlsPublicCert:String = ""
    public var factomdLocation:String = ""
    public var walletdLocation:String = ""
}
