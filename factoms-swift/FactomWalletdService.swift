//
//  FactomWalletdService.swift
//  Factom-swift
//
//  Created by Atul Tiwari on 17/10/19.
//  Copyright © 2019 Atul Tiwari. All rights reserved.
//

import Foundation

/// FactomWalletdService  serves the wallet API
///
/// Import factoms-api and alamofire before using this class other wise it wont work
public class FactomWalletdService {
    
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    private let factomWalletdUrl = "https://dev.factomd.net/v2"
    
    /// initializer
    public init() {
        
    }
    
    /// Method is used to add entry credit outputs
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addEcOutput(txName:String, address:String, amount:Double ,completion:@escaping APICompletionHandler) {
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
    
    
    
    /// Addfee is a shortcut and safeguard for adding the required additional factoshis to covert the fee.
    /// The fee is displayed in the returned transaction after each step, but addfee should be used instead of manually adding the additional input. This will help to prevent overpaying.‌
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addFee(txName:String, address:String, amount:Double ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Adds an input to the transaction from the given address.
    ///  The public address is given, and the wallet must have the private key associated with the address to successfully sign the transaction.‌
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addInput(txName:String, address:String, amount:Double ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Adds a factoid address output to the transaction.
    ///  Keep in mind the output is done in factoshis.
    ///   1 factoid is 1,000,000,000 factoshis.‌
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addOutput(txName:String, address:String, amount:Double ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Retrieve the public and private parts of a Factoid or Entry Credit address stored in the wallet.‌
    /// - Parameter address: address of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func getAddress(address:String ,completion:@escaping APICompletionHandler) {
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

    /// ‌Retrieve all of the Factoid and Entry Credit addresses stored in the wallet.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func GetAllAddress(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "all-addresses"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// This method, compose-chain, will return the appropriate API calls to create a chain in factom. You must first call the commit-chain, then the reveal-chain API calls. To be safe, wait a few seconds after calling commit.‌
    /// - Parameter extids: pass an array of string
    /// - Parameter content: pass a string
    /// - Parameter ecpub: pass a string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeChain(extids:[String], content:String, ecpub:String ,completion:@escaping APICompletionHandler) {
        let hexString = extids.map { (message:String) -> String in
            let data = Data(message.utf8)
            return data.map{ String(format:"%02x", $0) }.joined()
        }
        self.params["method"] = "compose-chain"
        self.params["params"] = ["chain":["firstentry":["extids":hexString, "content":content]], "ecpub":ecpub]
          ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    
    /// This method, compose-entry, will return the appropriate API calls to create an entry in factom.
    /// You must first call the commit-entry, then the reveal-entry API calls.
    ///  To be safe, wait a few seconds after calling commit.‌
    /// - Parameter chainId: pass a chainId of type  string
    /// - Parameter extids: pass an array of string
    /// - Parameter content: pass a string
    /// - Parameter ecpub: pass a string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeEntry(chainId:String, extids:[String], content:String, ecpub:String ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Compose transaction marshals the transaction into a hex encoded string.
    /// - Parameter txName: transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeTransaction(txName:String ,completion:@escaping APICompletionHandler) {
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
    
    
    /// ‌Deletes a working transaction in the wallet. The full transaction will be returned, and then deleted.‌
    /// - Parameter txName: transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func deleteTransaction(txName:String ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Create a new Entry Credit Address and store it in the wallet.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func generateEcAddress(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "generate-ec-address"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    /// ‌Create a new Entry Credit Address and store it in the wallet.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func generateFactoid(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "generate-factoid-address"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    /// Get the current hight of blocks that have been cached by the wallet while syncing.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func getHeight(completion:@escaping APICompletionHandler) {
           
           self.params["method"] = "get-height"
           
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               guard error == nil else {
                   completion(nil, error!)
                   return
               }
               completion(response!, nil)
           }
       }
    
    
    /// Import Factoid and/or Entry Credit address secret keys into the wallet.‌
    /// - Parameter addresses: pass a array of dictionary
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func importAddress(addresses:[[String:String]], completion:@escaping APICompletionHandler) {
           
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
    
    /// ‌Import a Koinify crowd sale address into the wallet.
    /// - Parameter words: pass a string of many different words
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func importKoinify(words:String, completion:@escaping APICompletionHandler) {
        
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
    
    /// This will create a new transaction.
    ///  The txid is in flux until the final transaction is signed.
    ///  Until then, it should not be used or recorded
    /// - Parameter txName: pass a transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func newTransaction(txName:String, completion:@escaping APICompletionHandler) {
        
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
    
    
    /// Retrieve current properties of factom-walletd, including the wallet and wallet API versions.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func properties(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "properties"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    /// Signs the transaction. It is now ready to be executed.‌
    /// - Parameter txName: pass a transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
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
    
    
    
    /// Using sub fee, you can use the receiving address in the parameters, and the fee will be deducted from their output amount.‌
    /// - Parameter txName: pass a transaction name of type string
    /// - Parameter address: pass a string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
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
    
    
    /// ‌Lists all the current working transactions in the wallet. These are transactions that are not yet sent
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func tempTransactions(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "temp-transactions"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// This will retrieve all transactions within a given block height range.‌
    /// - Parameter start: starting point of type Int
    /// - Parameter end: end point of type Int
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func transactionUsingRange(start:Int, end:Int, completion:@escaping APICompletionHandler) {
        
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
    
    
    /// This will retrieve a transaction by the given TxID.
    ///  This call is the fastest way to retrieve a transaction, but it will not display the height of the transaction.
    ///  If a height is in the response, it will be 0. To retrieve the height of a transaction, use the 'By Address’ method‌
    /// - Parameter txId: transactionId of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func transactionById(txId:String, completion:@escaping APICompletionHandler) {
        
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
    
    
    /// Retrieves all transactions that involve a particular address
    /// - Parameter address: pass address of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func transactionByAddress(address:String, completion:@escaping APICompletionHandler) {
        
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
    
    
    /// Retrieves all transactions
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func allTransactions(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "transactions"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Return the wallet seed and all addresses in the wallet for backup and offline storage.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func walletBackup(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "wallet-backup"
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// The wallet-balances API is used to query the acknowledged and saved balances for all addresses in the currently running factom-walletd.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func walletBalances(completion:@escaping APICompletionHandler) {
        
        self.params["method"] = "wallet-balances"
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// show the error type and error code
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func errors(completion:@escaping APICompletionHandler) {
        
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
