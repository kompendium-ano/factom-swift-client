//
//  DebugService.swift
//  factoms-swift
//
//  Created by Atul Tiwari on 18/10/19.
//  Copyright © 2019 Atul Tiwari. All rights reserved.
//

import Foundation

/// These API calls are primarily for debugging purposes.
///
/// Import factoms-api and alamofire before using this class other wise it wont work
public class DebugService {
    
    private let debugServiceUrl = "https://dev.factomd.net/v2";
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    public init() {
        
    }
    
    
    /// Shows current holding messages in the queue.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func holdingQueue(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "holding-queue"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Get information on the current network factomd is connected to (TEST, MAIN, etc).
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func networkingInfo(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "networking-info"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Get the predicted future entry credit rate.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func predictiveFer(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "predictive-fer"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Get a list of the current network audit servers along with their information.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func auditServers(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "audit-servers"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Get a list of the current network federated servers along with their information.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func federatedServers(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "federated-servers"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Get the current configuration state from factomd.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
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
    
    
    /// Get the process list known to the current factomd instance.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func processList(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "process-list"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// List of authority servers in the management chain.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func authorites(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "authorites"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Causes factomd to re-read the configuration from the config file.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func reloadConfiguration(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "reload-configuration"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Get the current package drop rate for network testing.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func dropRate(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "drop-rate"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Change the network drop rate for testing.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func setDropRate(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "set-drop-rate"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Get the current msg delay time for network testing
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func delay(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    /// Set the current msg delay time for network testing.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func setDelay(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "set-delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    /// Get the nodes summary string.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func summary(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "set-delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    /// Get a list of messages from the message journal
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func messages(completion:@escaping APICompletionHandler) {
        
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
