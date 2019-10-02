//
//  FactomWalletdService.swift
//  Factom-swift
//
//  Created by Atul Tiwari on 17/10/19.
//  Copyright © 2019 Atul Tiwari. All rights reserved.
//

import Foundation

public class FactomWalletdService {
    
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    private let factomWalletdUrl = "http://192.168.3.109:8089/v2"
    
    public init() {
        
    }
    
    // add ec-output
    public func addEcOutputService(txName:String, address:String, amount:Double ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "add-ec-output"
        self.params["params"] = ["tx-name":txName, "address":address, "amount":amount]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // add-fee
    public func addFeeService(txName:String, address:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "add-fee"
        self.params["params"] = ["tx-name":txName, "address":address]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // add-input
    public func addInputService(txName:String, address:String, amount:Double ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "add-input"
        self.params["params"] = ["tx-name":txName, "address":address, "amount":amount]
       ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // add-output
    public func addOutputService(txName:String, address:String, amount:Double ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "add-output"
           self.params["params"] = ["tx-name":txName, "address":address, "amount":amount]
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    // get address
    public func getAddressService(address:String ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "address"
           self.params["params"] = ["address":address]
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }

    // Get alladdresses
    public func GetAllAddressService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "all-addresses"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // compose-chain
    public func composeChainService(extids:[String], content:String, ecpub:String ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "compose-chain"
        self.params["params"] = ["chain":["firstentry":["extids":extids, "content":content]], "ecpub":ecpub]
          ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    // compose-entry
    public func composeEntryService(chainId:String, extids:[String], content:String, ecpub:String ,completion:@escaping APICompletionHandler) {
           self.params["method"] = "compose-entry"
        self.params["params"] = ["entry":["chainid":chainId, "extids":extids, "content":content], "ecpub":ecpub]
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    // compose-transaction
    
    public func composeTransactionService(txName:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "compose-transaction"
        self.params["params"] = ["tx-name":txName]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // delete-transaction
    public func deleteTransactionService(txName:String ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "delete-transaction"
        self.params["params"] = ["tx-name":txName]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //generate-ec-address
    public func generateEcAddressService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "generate-ec-address"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //generate-factoid-address
    public func generateFactoidAddressService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "generate-factoid-address"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //get-height
    public func getHeightService(completion:@escaping APICompletionHandler) {
           
           self.params["method"] = "get-height"
           
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    //import-addresses

    //addresses value in parameter will be like below ......
    //for example
    //[{"secret":"Fs2G4Hs9YxqBZ8TkfyWwNKmJbwet3Zg1JNXt8MrQReCEph6rGt9v"},{"secret":"Es3tXbGBVKZDhUWzDKzQtg4rcpmmHPXAY9vxSM2JddwJSD5td3f8"}]
    
    public func importAddressService(addresses:[[String:String]], completion:@escaping APICompletionHandler) {
           
           self.params["method"] = "import-addresses"
        self.params["params"] = ["addresses":addresses]
           
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    //import-koinify
    
    public func importKoinifyService(words:String, completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "import-koinify"
        self.params["params"] = ["words":words]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // new-transaction
    
    public func newTransactionService(txName:String, completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "import-addresses"
        self.params["params"] = ["tx-name":txName]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //properties
    
    public func propertiesService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "properties"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //sign-transaction
    public func signTransactionService(txName:String, completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "sign-transaction"
     self.params["params"] = ["tx-name":txName]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // sub-fee
    
    public func subFeeService(txName:String, address:String, completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "sub-fee"
        self.params["params"] = ["tx-name":txName,"address":address]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //tmp-transactions
    public func tempTransactionsService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "temp-transactions"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //transactions(retrieving)
    
    public func transactionUsingRangeService(start:Int, end:Int, completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "transactions"
        self.params["params"] = ["range":["start":start, "end":end]]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //transactions byTxId
    public func transactionByIdService(txId:String, completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "transactions"
        self.params["params"] = ["txid":txId]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //transactions by address
    public func transactionByAddressService(address:String, completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "transactions"
        self.params["params"] = ["address":address]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    // all transactions
    public func allTransactionsService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "transactions"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //wallet-backup
    public func walletBackupService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "wallet-backup"
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //wallet-balances
    public func walletBalancesService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "wallet-balances"
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    //errors
    
    public func errorsService(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "bad"
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
}
