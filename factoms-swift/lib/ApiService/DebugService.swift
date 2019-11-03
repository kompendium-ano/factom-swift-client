//
//  DebugService.swift
//  factoms-swift
//
//  Created by Aman Joshi on 18/10/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation
/// These API calls are primarily for debugging purposes.
///
/// Import factoms-api and alamofire before using this class other wise it wont work
public class DebugService {
    
    private var debugServiceUrl = "http://localhost:8000";
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    
    public init(config:Config) {
        self.debugServiceUrl = config.host+":\(config.port)"
    }
    
    /// Shows current holding messages in the queue.‌
    /// - Parameter completion: give response of type HoldingQueueModel  if successful and error if request falis
    public func holdingQueue(completion:@escaping (_ model:HoldingQueueModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "holding-queue"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = HoldingQueueModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Get information on the current network factomd is connected to (TEST, MAIN, etc).
    /// - Parameter completion: give response of type NetworkInfoModel  if successful and error if request falis
    public func networkingInfo(completion:@escaping (_ model:NetworkInfoModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "networking-info"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = NetworkInfoModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Get the predicted future entry credit rate.‌
    /// - Parameter completion: give response of type PredictiveFerModel  if successful and error if request falis
    public func predictiveFer(completion:@escaping (_ model:PredictiveFerModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "predictive-fer"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = PredictiveFerModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
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
    /// - Parameter completion: give response of type FederatedServersModel  if successful and error if request falis
    public func federatedServers(completion:@escaping (_ model:FederatedServersModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "federated-servers"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = FederatedServersModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Get the current configuration state from factomd.‌
    /// - Parameter completion: give response of type ConfigurationModel  if successful and error if request falis
    public func configuration(completion:@escaping (_ model:ConfigurationModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "configuration"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
           if let result = response?.result {
                let model = ConfigurationModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
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
    /// - Parameter completion: give response of type AuthoritiesModel  if successful and error if request falis
    public func authorities(completion:@escaping (_ model:AuthoritiesModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "authorities"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AuthoritiesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Causes factomd to re-read the configuration from the config file.
    /// - Parameter completion: give response of type ConfigurationModel  if successful and error if request falis
    public func reloadConfiguration(completion:@escaping (_ model:ConfigurationModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "reload-configuration"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ConfigurationModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Get the current package drop rate for network testing.‌
    /// - Parameter completion: give response of type DropRateModel  if successful and error if request falis
    public func dropRate(completion:@escaping (_ model:DropRateModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "drop-rate"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = DropRateModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Change the network drop rate for testing.‌
    /// - Parameter completion: give response of type DropRateModel  if successful and error if request falis
    public func setDropRate(completion:@escaping (_ model:DropRateModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "set-drop-rate"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = DropRateModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Get the current msg delay time for network testing
    /// - Parameter completion: give response of type DelayModel  if successful and error if request falis
    public func delay(completion:@escaping (_ model:DelayModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = DelayModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Set the current msg delay time for network testing.‌
    /// - Parameter completion: give response of type DelayModel  if successful and error if request falis
    public func setDelay(completion:@escaping (_ model:DelayModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "set-delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = DelayModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Get the nodes summary string.‌
    /// - Parameter completion: give response of type SummaryModel  if successful and error if request falis
    public func summary(completion:@escaping (_ model:SummaryModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "set-delay"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = SummaryModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Get a list of messages from the message journal
    /// - Parameter completion: give response of type MessagesModel  if successful and error if request falis
    public func messages(completion:@escaping (_ model:MessagesModel?, _ error:ErrorModel?) -> Void) {
        
        self.params["method"] = "messages"
        
        ApiManager.shared.httpRequest(urlString: debugServiceUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = MessagesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
}
