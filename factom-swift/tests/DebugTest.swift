//
//  DebugTest.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 31/10/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import UIKit
///Always import the below frameworks to make use of the factom
//import Alamofire
//import factom_swift

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
        self.debug.holdingQueue { (model, error) in
            if model != nil {
                print(model!.messages![0])
            }else{
                print(error!.message)
            }
        }
        
        //networkingInfo
        self.debug.networkingInfo { (model, error) in
           if model != nil {
            print(model!.networkName)
            }else{
                print(error!.message)
            }
        }
        
        //predictiveFer
        self.debug.predictiveFer { (model, error) in
            if model != nil {
                print(model!.predictiveFer)
            }else{
                print(error!.message)
            }
        }
        
        //auditServers
        self.debug.auditServers { (response, error) in
            if response != nil {
                if let result = response!.result {
                    let AuditServers = result["AuditServers"]
                    print(AuditServers!)
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //federatedServers
        self.debug.federatedServers { (model, error) in
            if model != nil {
                print(model!.federatedServers![0].name)
            }else{
                print(error!.message)
            }
        }
        
        //configuration
        self.debug.configuration { (model, error) in
            if model != nil {
                print(model!.app!.changeAcksHeight)
            }else{
                print(error!.message)
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
        self.debug.authorities { (model, error) in
            if model != nil {
                print(model!.authorities![0].authorityChainId)
            }else{
                print(error!.message)
            }
        }
        
        
        //reloadConfiguration
        self.debug.reloadConfiguration { (model, error) in
            if model != nil {
                print(model!.app!.changeAcksHeight)
            }else{
                print(error!.message)
            }
        }
        
        
        //dropRate
        self.debug.dropRate { (model, error) in
            if model != nil {
                print(model!.dropRate)
            }else{
                print(error!.message)
            }
        }
        
        //setDropRate
        self.debug.setDropRate { (model, error) in
            if model != nil {
                print(model!.dropRate)
            }else{
                print(error!.message)
            }
        }
        
        
        //delay
        self.debug.delay { (model, error) in
            if model != nil {
                print(model!.delay)
            }else{
                print(error!.message)
            }
        }
        
        
        //setDelay
        self.debug.setDelay { (model, error) in
            if model != nil {
                print(model!.delay)
            }else{
                print(error!.message)
            }
        }
        
        //summary
        self.debug.summary { (model, error) in
            if model != nil {
                print(model!.summary)
            }else{
                print(error!.message)
            }
        }
        
        //messages
        self.debug.messages { (model, error) in
            if model != nil {
                print(model!.messages[0])
            }else{
                print(error!.message)
            }
        }
    }
}
