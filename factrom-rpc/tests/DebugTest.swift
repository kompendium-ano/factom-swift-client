//
//  DebugTest.swift
//  factoms-swift
//
//  Created by Sergey Bushnyak on 31/10/19.
//  Copyright © 2019  Kompendium, LLC. All rights reserved.
//

import UIKit
///Always import the below frameworks to make use of the factom
//import Alamofire
//import factoms_swift

class DebugTest: UIViewController {

    //MARK: - Properties
    
    ///create an instance of Config class by passing the parameters to constructor
    /// change the host, port ,walletdPort as you want
    let config = Config.init(host: "http://abc.com", port: "8000", walletdPort: "8009")
    
    var debug:DebugService!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.debug = DebugService.init(config: config)
        
        self.executeAllMethods()
    }
    
    //MARK: - Methods
    
    //you can use all these methods seprately whereever you need it
    // calling all these methods in a single method is for example
    //you can call these methods from 'debug' instance of DebugService class.
    func executeAllMethods() {
        
        
        //holdingQueue
        self.debug.holdingQueue { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let messages = result["Messages"]
                    print(messages!)
                }
                
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //networkingInfo
        self.debug.networkingInfo { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let networkNumber = result["NetworkNumber"]
                    print(networkNumber!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //predictiveFer
        self.debug.predictiveFer { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let predictiveFER = result["PredictiveFER"]
                    print(predictiveFER!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //auditServers
        self.debug.auditServers { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let AuditServers = result["AuditServers"]
                    print(AuditServers!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //federatedServers
        self.debug.federatedServers { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let FederatedServers = result["FederatedServers"] as? [[String:String]] {
                        let chainId = FederatedServers[0]["ChainId"]
                        print(chainId!)
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //configuration
        self.debug.configuration { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let app = result["App"] as? JSONObject {
                        let portNumber = app["PortNumber"]
                        print(portNumber!)
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //processList
        self.debug.processList { (response, error) in
            if response != nil {
                print(response!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //authorities
        self.debug.authorities { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let Authorities = result["Authorities"] as? [[String:String]] {
                        let AuthorityChainID = Authorities[0]["AuthorityChainID"]
                        print(AuthorityChainID!)
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //reloadConfiguration
        self.debug.reloadConfiguration { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let app = result["App"] as? JSONObject {
                        let portNumber = app["PortNumber"]
                        print(portNumber!)
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //dropRate
        self.debug.dropRate { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let DropRate = result["DropRate"]
                    print(DropRate!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //setDropRate
        self.debug.setDropRate { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let DropRate = result["DropRate"]
                    print(DropRate!)
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //delay
        self.debug.delay { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let Delay = result["Delay"]
                    print(Delay!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //setDelay
        self.debug.setDelay { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let Delay = result["Delay"]
                    print(Delay!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //summary
        self.debug.summary { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    let Summary = result["Summary"]
                    print(Summary!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //messages
        self.debug.messages { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let messages = result["Messages"] as? [String] {
                        print(messages)
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
    }
}
