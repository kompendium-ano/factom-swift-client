//
//  FactomdService.swift
//  Factom-swift
//
//  Created by Sergey Bushnyak on 17/10/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation

/// The API is designed for outside application to process transactions and interact with the Factom federated servers.
///
/// Import factom-api and alamofire before using this class other wise it wont work
public class FactomdService {
    
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    private var factomdUrl = "http://localhost:8000";
    
    
    /// initialize
    public init(config:Config) {
        self.factomdUrl = config.host+":\(config.port)"
    }
    
    /// Retrieve administrative blocks for any given height.
    /// - Parameter height: pass height of type int
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func ablockByHeight(height:Int ,completion:@escaping ((_ model:ABlockByHeightModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "ablock-by-height"
        self.params["params"] = ["height":height]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ABlockByHeightModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    ///  This Method  is used to find the status of a transaction, whether it be a factoid, reveal entry, or commit entry.
    /// - Parameter hash: pass a string
    /// - Parameter chainId: pass chainId
    /// - Parameter fullTransaction: pass a type of string , this can be optional
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func ack(hash:String, chainId:String, fullTransaction:String? ,completion:@escaping APICompletionHandler) {
        self.params["method"] = "ablock-by-height"
        self.params["params"] = ["hash":hash,"chainid":chainId, "fulltransaction":fullTransaction ?? ""]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Retrieve a specified admin block given its merkle root key.
    /// - Parameter keymr: pass a keymr of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func adminBlock(keymr:String,completion:@escaping APICompletionHandler) {
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
    
    /// Retrieve information about the directory block anchors that have been confirmed on Bitcoin and Ethereum.
    /// - Parameter hash: pass hash of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func anchors(hash:String,completion:@escaping APICompletionHandler) {
        self.params["method"] = "anchors"
        self.params["params"] = ["hash":hash]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    /// Return the keymr of the head of the chain for a chain ID (the unique hash created when the chain was created).
    /// - Parameter chainId: pass chainId as a String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func chainHead(chainId:String ,completion:@escaping (_ model:ChainHeadModel?, _ error:GenError?) -> Void){
        self.params["method"] = "chain-head"
        self.params["params"] = ["chainid":chainId]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ChainHeadModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    
    /// Send a Chain Commit Message to factomd to create a new Chain.
    /// - Parameter message: pass a message of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func commitChain(message:String ,completion:@escaping (_ model:CommitChainModel?, _ error:GenError?) -> Void) {
        //convert string to hex
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        self.params["method"] = "commit-chain"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = CommitChainModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Send an Entry Commit Message to factom to create a new Entry.
    /// - Parameter message: pass a message of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func commitEntry(message:String ,completion:@escaping (_ model:CommitEntryModel?, _ error:GenError?) -> Void) {
        //convert string to hex
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        
        self.params["method"] = "commit-entry"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = CommitEntryModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// The current-minute API call returns:
    ///leaderheight returns the current block height.
    ///directoryblockheight returns the last saved height.
    ///minute returns the current minute number for the open entry block.
    ///currentblockstarttime returns the start time for the current block.
    ///currentminutestarttime returns the start time for the current minute.
    ///currenttime returns the current nodes understanding of current time.
    ///directoryblockinseconds returns the number of seconds per block.
    ///stalldetected returns if factomd thinks it has stalled.
    ///faulttimeout returns the number of seconds before leader node is faulted for failing to provide a necessary message.
    ///roundtimeout returns the number of seconds between rounds of an election during a fault.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func currentTime(completion:@escaping (_ model:CurrentMinuteModel?, _ error:GenError?) -> Void) {
        
        self.params["method"] = "current-minute"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = CurrentMinuteModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieves a directory block given only its height.
    /// - Parameter height: pass a height of type Int64
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func dBlockByHeight(height:Int64 ,completion:@escaping (_ model:DBlockByHeightModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "dblock-by-height"
        self.params["params"] = ["height":height]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = DBlockByHeightModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Retrieve basic system information along with a description of the node’s current perception of the network.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func diagnostics(completion:@escaping APICompletionHandler) {
        self.params["method"] = "diagnostics"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error!)
                return
            }
            completion(response!, nil)
        }
    }
    
    
    
    /// Every directory block has a KeyMR (Key Merkle Root), which can be used to retrieve it.
    /// The response will contain information that can be used to navigate through all transactions (entry and factoid) within that block.
    /// - Parameter keymr: pass a keymr of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func directoryBlock(keymr:String ,completion:@escaping (_ model:DirectoryBlockModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "directory-block"
        self.params["params"] = ["keymr":keymr]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = DirectoryBlockModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// The directory block head is the last known directory block by factom, or in other words, the most recently recorded block.
    /// This can be used to grab the latest block and the information required to traverse the entire blockchain.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func directoryBlockHead(completion:@escaping (_ model:DirectoryBlockHeadModel?, _ error:GenError?) -> Void) {
           self.params["method"] = "directory-block-head"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = DirectoryBlockHeadModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
           }
       }
    
    
    /// Retrieve the entry credit block for any given height. These blocks contain entry credit transaction information.
    /// - Parameter height: pass height of type Int64
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func ecBlockByHeight(height:Int64 ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Get an Entry from factomd specified by the Entry Hash.
    /// - Parameter hash: pass a string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func entry(hash:String ,completion:@escaping (_ model:EntryModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "entry"
        self.params["params"] = ["hash":hash]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = EntryModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Entry Acknowledgements will give the current status of a transaction.
    ///  “DBlockConfirmed” is the highest level of confirmation you can obtain.
    ///   This means the entry has made it into Factom.
    /// - Parameter txid: transactionId of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func entryAck(txid:String ,completion:@escaping (_ model:EntryAckModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "entry-ack"
        self.params["params"] = ["txid":txid]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = EntryAckModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve a specified entry block given its merkle root key. The entry block contains 0 to many entries
    /// - Parameter keymr: pass a keymr of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func entryBlock(keymr:String ,completion:@escaping (_ model:EntryBlockModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "entry-block"
        self.params["params"] = ["keymr":keymr]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = EntryBlockModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Return its current balance for a specific entry credit address.
    /// - Parameter address: pass an address of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func entryCreditBalance(address:String ,completion:@escaping (_ model:EntryCreditBalanceModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "entry-credit-balance"
        self.params["params"] = ["address":address]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = EntryCreditBalanceModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve a specified entrycredit block given its merkle root key. The numbers are minute markers.
    /// - Parameter keymr: pass a keymr of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func entryCreditBlock(keymr:String ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Returns the number of Factoshis (Factoids *10^-8) that purchase a single Entry Credit.
    ///  The minimum factoid fees are also determined by this rate, along with how complex the factoid transaction is.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func entryCreditRate(completion:@escaping (_ model:EntryCreditRateModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "entry-credit-rate"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = EntryCreditRateModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Factoid Acknowledgements will give the current status of a transaction.
    ///  “DBlockConfirmed” is the highest level of confirmation you can obtain.
    ///  This means the transaction has completed.
    /// - Parameter txid: transactionId of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func factoidAck(txid:String ,completion:@escaping (_ model:FactoidAckModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "factoid-ack"
        self.params["params"] = ["txid":txid]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = FactoidAckModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// This method returns the number of Factoshis (Factoids *10^-8) that are currently available at the address specified.
    /// - Parameter address: pass an address of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func factoidBalance(address:String ,completion:@escaping (_ model:FactoidBalanceModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "factoid-balance"
        self.params["params"] = ["address":address]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = FactoidBalanceModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve a specified factoid block given its merkle root key.
    /// - Parameter keymr: pass a keymr description
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func factoidBlock(keymr:String ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Retrieve a specified factoid block given its merkle root key.
    /// - Parameter transaction: <#transaction description#>
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func factoidSubmit(transaction:String ,completion:@escaping (_ model:FactoidSubmitModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "factoid-submit"
        self.params["params"] = ["transaction":transaction]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = FactoidSubmitModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve the factoid block for any given height. These blocks contain factoid transaction information.
    /// - Parameter height: pass an height of type Int64
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func fBlockByHeight(height:Int64 ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Returns various heights that allows you to view the state of the blockchain. The heights returned provide a lot of information regarding the state of factomd, but not all are needed by most applications.
    /// directoryblockheight : The current directory block height of the local factomd node.
    /// leaderheight : The current block being worked on by the leaders in the network. This block is not yet complete, but all transactions submitted will go into this block (depending on network conditions, the transaction may be delayed into the next block)
    /// entryblockheight : The height at which the factomd node has all the entry blocks. Directory blocks are obtained first, entry blocks could be lagging behind the directory block when syncing.
    /// entryheight : The height at which the local factomd node has all the entries. If you added entries at a block height above this, they will not be able to be retrieved by the local factomd until it syncs further.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func heights(completion:@escaping (_ model:HeightsModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "heights"
       ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = HeightsModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// The multiple-ec-balances API is used to query the acknowledged and saved balances for a list of entry credit addresses.
    /// - Parameter addresses: pass an address of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func multipleEcBalances(addresses:[String] ,completion:@escaping (_ model:MultipleBalancesModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "multiple-ec-balances"
        self.params["params"] = ["addresses":addresses]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = MultipleBalancesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// The multiple-fct-balances API is used to query the acknowledged and saved balances in factoshis (a factoshi is 10^8 factoids) not factoids(FCT) for a list of FCT addresses.
    /// - Parameter addresses: pass an address of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func multipleFctBalances(addresses:[String] ,completion:@escaping (_ model:MultipleBalancesModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "multiple-fct-balances"
        self.params["params"] = ["addresses":addresses]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = MultipleBalancesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Returns an array of the entries that have been submitted but have not been recorded into the blockchain.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func pendingEntries(completion:@escaping (_ model:PendingEntriesModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "pending-entries"
        self.params["params"] = [:]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = PendingEntriesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Returns an array of factoid transactions that have not yet been recorded in the blockchain, but are known to the system.
    /// - Parameter address: pass an address of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func pendingTransactions(address:String ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Retrieve current properties of the Factom system, including the software and the API versions.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func properties(completion:@escaping (_ model:PropertiesModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "properties"
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = PropertiesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve an entry or transaction in raw format, the data is a hex encoded string.
    /// - Parameter hash: pass a hash of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func rawData(hash:String ,completion:@escaping (_ model:RawDataModel?, _ error:GenError?) -> Void) {
        self.params["method"] = "raw-data"
        self.params["params"] = ["hash":hash]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = RawDataModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve a receipt providing cryptographically verifiable proof that information was recorded in the factom blockchain and that this was subsequently anchored in the bitcoin blockchain.
    /// - Parameter hash: pass a hash of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func receipt(hash:String ,completion:@escaping APICompletionHandler) {
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
    
    
    /// Reveal the First Entry in a Chain to factomd after the Commit to complete the Chain creation.
    /// - Parameter entry: pass an entry of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func revialChain(entry:String ,completion:@escaping (_ model:RevealModel?, _ error:GenError?) -> Void) {
           self.params["method"] = "reveal-chain"
           self.params["params"] = ["entry":entry]
           ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = RevealModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
           }
       }
    
    
    /// Reveal an Entry to factomd after the Commit to complete the Entry creation.
    /// - Parameter entry: pass an entry of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func revealEntry(entry:String ,completion:@escaping (_ model:RevealModel?, _ error:GenError?) -> Void) {
           self.params["method"] = "reveal-entry"
           self.params["params"] = ["entry":entry]
           ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = RevealModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
           }
       }
    
    
    /// sendRawMessageToCheckCommit
    /// - Parameter message: pass a message of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func sendRawMessageToCheckCommit(message:String ,completion:@escaping (_ model:RawMessageModel?, _ error:GenError?) -> Void) {
        
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        
        self.params["method"] = "send-raw-message"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = RawMessageModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// sendRawMessageToCheckRevealChain
    /// - Parameter message: pass a message of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func sendRawMessageToCheckRevealChain(message:String ,completion:@escaping (_ model:RawMessageModel?, _ error:GenError?) -> Void) {
        
        let data = Data(message.utf8)
        let hexString = data.map{ String(format:"%02x", $0) }.joined()
        
        self.params["method"] = "send-raw-message"
        self.params["params"] = ["message":hexString]
        ApiManager.shared.httpRequest(urlString: factomdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = RawMessageModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve details of a factoid transaction using a transaction’s hash (or corresponding transaction id).
    /// - Parameter hash: pass a hash of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func transaction(hash:String ,completion:@escaping APICompletionHandler) {
        
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
