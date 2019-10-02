//
//  DebugService.swift
//  factoms-swift
//
//  Created by Atul Tiwari on 18/10/19.
//  Copyright © 2019 Atul Tiwari. All rights reserved.
//

import Foundation

public class DebugService {
    
    private let debugServiceUrl = "http://192.168.3.109:8088/v2";
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    public init() {
        
    }
    
    // holding-queue
    public func holdingQueueService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "holding-queue"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //network-info
    public func networkingInfoService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "networking-info"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // predictive-fer
    
    public func predictiveFerService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "predictive-fer"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // audit-servers
    public func auditServersService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "audit-servers"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //federated-servers
    public func federatedServersService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "federated-servers"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // configuration
    public func configurationService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "configuration"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //process-list
    public func processListService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "process-list"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //authorities
    public func authoritesService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "authorites"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //reload-configuration
    public func reloadConfigurationService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "reload-configuration"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //drop-rate
    public func dropRateService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "drop-rate"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // set-drop-rate
    public func setDropRateService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "set-drop-rate"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //delay
    public func delayService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //set-delay
    public func setDelayService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "set-delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //messages
    public func messagesService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "messages"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
}
