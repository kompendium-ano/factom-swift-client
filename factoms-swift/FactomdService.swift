//
//  FactomdService.swift
//  Factom-swift
//
//  Created by Atul Tiwari on 17/10/19.
//  Copyright © 2019 Atul Tiwari. All rights reserved.
//

import Foundation

public class FactomdService {
    
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    private let factomdUrl = "https://dev.factomd.net/v2";
    
    public init() {}
    
    // ablock-by-height
       public func ablockByHeightService(height:Int ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "ablock-by-height"
           self.params["params"] = ["height":height]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    //ack
    public func ackService(hash:String, chainId:String, fullTransaction:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "ablock-by-height"
        self.params["params"] = ["hash":hash,"chainid":chainId, "fulltransaction":fullTransaction]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //admin-block
    public func adminBlockService(keymr:String,completion:@escaping APICompletionHandler) {
        self.params["method"] = "admin-block"
        self.params["params"] = ["keymr":keymr]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // chain-head
    public func chainHeadService(chainId:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "chain-head"
        self.params["params"] = ["chainid":chainId]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //commit-chain
    
    public func commitChainService(message:String ,completion:@escaping APICompletionHandler) {
        //convert string to hex
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        self.params["method"] = "commit-chain"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //commit - entry
    
    public func commitEntryService(message:String ,completion:@escaping APICompletionHandler) {
        //convert string to hex
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        
        self.params["method"] = "commit-entry"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //current-minute
    public func currentTimeService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "current-minute"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //dblock-by-height
    public func dBlockByHeightService(height:Int64 ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "dblock-by-height"
        self.params["params"] = ["height":height]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //directory-block
    
    public func directoryBlockService(keymr:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "directory-block"
        self.params["params"] = ["keymr":keymr]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // directory-block-head
    public func directoryBlockHeadService(completion:@escaping APICompletionHandler) {
           self.params["method"] = "directory-block-head"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    //ecblock-by-height
    public func ecBlockByHeightService(height:Int64 ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "ecblock-by-height"
           self.params["params"] = ["height":height]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    //entry
    public func entryService(hash:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "entry"
        self.params["params"] = ["hash":hash]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //entry-ack
    public func entryAckService(txid:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "entry-ack"
        self.params["params"] = ["txid":txid]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // entry-block
    public func entryBlockService(keymr:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "entry-block"
        self.params["params"] = ["keymr":keymr]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //entry-credit-balance
    public func entryCreditBalanceService(address:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "entry-credit-balance"
        self.params["params"] = ["address":address]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //entrycredit-block
    public func ebtryCreditBlockService(keymr:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "entrycredit-block"
        self.params["params"] = ["keymr":keymr]
       ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //entry-credit-rate
    public func entryCreditRateService(completion:@escaping APICompletionHandler) {
        self.params["method"] = "entry-credit-rate"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //factoid-ack
    public func factoidAckService(txid:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "factoid-ack"
        self.params["params"] = ["txid":txid]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //factoid-balance
    public func factoidBalanceService(address:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "factoid-balance"
        self.params["params"] = ["address":address]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //factoid-block
    public func factoidBlockService(keymr:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "factoid-block"
        self.params["params"] = ["keymr":keymr]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //factoid-submit
    public func factoidSubmitService(transaction:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "factoid-submit"
        self.params["params"] = ["transaction":transaction]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //fblock-by-height
    public func fBlockByHeightService(height:Int64 ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "fblock-by-height"
        self.params["params"] = ["height":height]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //heights
    public func heightsService(completion:@escaping APICompletionHandler) {
        self.params["method"] = "heights"
       ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //multiple-ec-balances
    public func multipleEcBalancesService(addresses:[String] ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "multiple-ec-balances"
        self.params["params"] = ["addresses":addresses]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //multiple-fct-balances
    public func multipleFctBalancesService(addresses:[String] ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "multiple-fct-balances"
        self.params["params"] = ["addresses":addresses]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //pending-entries
    public func pendingEntriesService(completion:@escaping APICompletionHandler) {
        self.params["method"] = "pending-entries"
        self.params["params"] = [:]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //pending-transactions
    public func pendingTransactionsService(address:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "pending-transactions"
        self.params["params"] = ["address":address]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //propeties
    public func propertiesService(completion:@escaping APICompletionHandler) {
        self.params["method"] = "properties"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //raw-data
    public func rawDataService(hash:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "raw-data"
        self.params["params"] = ["hash":hash]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //receipt
    public func receiptService(hash:String ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "receipt"
           self.params["params"] = ["hash":hash]
          ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    //reveal-chain
    public func revialChainService(entry:String ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "reveal-chain"
           self.params["params"] = ["entry":entry]
           ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    //reveal-entry
    public func revealEntryService(entry:String ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "reveal-entry"
           self.params["params"] = ["entry":entry]
           ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    // send-raw-message
    public func sendRawMessageToCheckCommitService(message:String ,completion:@escaping APICompletionHandler) {
        
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        
        self.params["method"] = "send-raw-message"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //to check reveal chain
    public func sendRawMessageToCheckRevealChainService(message:String ,completion:@escaping APICompletionHandler) {
        
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        
        self.params["method"] = "send-raw-message"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //transaction
    public func transactionService(hash:String ,completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "send-raw-message"
        self.params["params"] = ["hash":hash]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
}
