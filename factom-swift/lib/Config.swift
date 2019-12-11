//
//  Config.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 31/10/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation

public class Config {
    
    public var host:String {
        didSet {
            print(host)
        }
    }
    public var port:String {
        didSet {
            print(port)
        }
    }
    public var walletdPort:String {
        didSet {
            print(walletdPort)
        }
    }
    
    public init(host:String, port:String, walletdPort:String) {
        self.host = host
        self.port = port
        self.walletdPort = walletdPort
    }
}
