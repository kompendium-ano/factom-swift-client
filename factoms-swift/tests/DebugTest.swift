//
//  DebugTest.swift
//  factoms-swift
//
//  Created by Aman Joshi on 31/10/19.
//  Copyright © 2019 Atul Tiwari. All rights reserved.
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
        self.debug.holdingQueue { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //networkingInfo
        self.debug.networkingInfo { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //predictiveFer
        self.debug.predictiveFer { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //auditServers
        self.debug.auditServers { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //federatedServers
        self.debug.federatedServers { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //configuration
        self.debug.configuration { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //processList
        self.debug.processList { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //authorities
        self.debug.authorities { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //reloadConfiguration
        self.debug.reloadConfiguration { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //dropRate
        self.debug.dropRate { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //setDropRate
        self.debug.setDropRate { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //delay
        self.debug.delay { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //setDelay
        self.debug.setDelay { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //summary
        self.debug.summary { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //messages
        self.debug.messages { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
    }

}
