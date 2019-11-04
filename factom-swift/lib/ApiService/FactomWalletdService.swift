//
//  FactomWalletdService.swift
//  Factom-swift
//
//  Created by Sergey Bushnyak on 17/10/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import Foundation

/// FactomWalletdService  serves the wallet API
///
/// Import factoms-api and alamofire before using this class other wise it wont work
public class FactomWalletdService {
    
    public var params = ["jsonrpc": "2.0", "id": 0] as [String : Any]
    //https://dev.factomd.net/v2
    private var factomWalletdUrl = "http://localhost:8000";
    
    /// initializer
    public init(config:Config) {
        self.factomWalletdUrl = config.host+":\(config.walletdPort)"
    }
    
    /// This method will return an identity’s set of public keys (in order of decreasing priority) that were active at a specific block, or at the most recent height if the "height" parameter is not included.
    /// - Parameter chainId: pass chainId of type String
    /// - Parameter height: pass height
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func activeIdentityKeys(chainId:String, height:Double, completion:@escaping ((_ model:ActiveIdentityKeysModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "active-identity-keys"
        self.params["params"] = ["chainId":chainId, "height":height]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ActiveIdentityKeysModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Method is used to add entry credit outputs
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addEcOutput(txName:String, address:String, amount:Double ,completion:@escaping ((_ model:AddECOutputModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "add-ec-output"
        self.params["params"] = ["tx-name":txName, "address":address, "amount":amount]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AddECOutputModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    
    /// Addfee is a shortcut and safeguard for adding the required additional factoshis to covert the fee.
    /// The fee is displayed in the returned transaction after each step, but addfee should be used instead of manually adding the additional input. This will help to prevent overpaying.‌
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addFee(txName:String, address:String, amount:Double ,completion:@escaping ((_ model:AddFeeModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "add-fee"
        self.params["params"] = ["tx-name":txName, "address":address]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
           if let result = response?.result {
                let model = AddFeeModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Adds an input to the transaction from the given address.
    ///  The public address is given, and the wallet must have the private key associated with the address to successfully sign the transaction.‌
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addInput(txName:String, address:String, amount:Double ,completion:@escaping ((_ model:AddInputModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "add-input"
        self.params["params"] = ["tx-name":txName, "address":address, "amount":amount]
       ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AddInputModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Adds a factoid address output to the transaction.
    ///  Keep in mind the output is done in factoshis.
    ///   1 factoid is 1,000,000,000 factoshis.‌
    /// - Parameter txName: transaction name of type String
    /// - Parameter address: address of type string
    /// - Parameter amount: amount of type double
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func addOutput(txName:String, address:String, amount:Double ,completion:@escaping ((_ model:AddOutputModel?, _ error:GenError?) -> Void)) {
           self.params["method"] = "add-output"
           self.params["params"] = ["tx-name":txName, "address":address, "amount":amount]
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = AddOutputModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
           }
       }
    
    
    /// Retrieve the public and private parts of a Factoid or Entry Credit address stored in the wallet.‌
    /// - Parameter address: address of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func address(address:String ,completion:@escaping ((_ model:AddressModel?, _ error:GenError?) -> Void)) {
           self.params["method"] = "address"
           self.params["params"] = ["address":address]
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = AddressModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
           }
       }

    /// ‌Retrieve all of the Factoid and Entry Credit addresses stored in the wallet.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func allAddress(completion:@escaping ((_ model:AllAddressesModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "all-addresses"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
           if let result = response?.result {
                let model = AllAddressesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// ‌Returns all of the identity key pairs that are currently stored in the wallet. If the wallet is encrypted, it must be unlocked prior to using this method.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
       public func allIdentityKeys(completion:@escaping ((_ model:AllIdentityKeysModel?, _ error:GenError?) -> Void)) {
           
           self.params["method"] = "all-identity-keys"
           
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = AllIdentityKeysModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
           }
       }
    
    
    /// This method, compose-chain, will return the appropriate API calls to create a chain in factom. You must first call the commit-chain, then the reveal-chain API calls. To be safe, wait a few seconds after calling commit.‌
    /// - Parameter extids: pass an array of string
    /// - Parameter content: pass a string
    /// - Parameter ecpub: pass a string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeChain(extids:[String], content:String, ecpub:String ,completion:@escaping ((_ model:ComposeModel?, _ error:GenError?) -> Void)) {
        let hexString = extids.map { (message:String) -> String in
            let data = Data(message.utf8)
            return data.map{ String(format:"%02x", $0) }.joined()
        }
        self.params["method"] = "compose-chain"
        self.params["params"] = ["chain":["firstentry":["extids":hexString, "content":content]], "ecpub":ecpub]
          ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = ComposeModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
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
    public func composeEntry(chainId:String, extids:[String], content:String, ecpub:String ,completion:@escaping ((_ model:ComposeModel?, _ error:GenError?) -> Void)) {
           self.params["method"] = "compose-entry"
        self.params["params"] = ["entry":["chainid":chainId, "extids":extids, "content":content], "ecpub":ecpub]
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = ComposeModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }
           }
       }
    
    /// This request allows one identity to state an attribute about another identity and publish that entry to any existing chain. An attribute is a set of generic key:value pairs that can be assigned to an identity and is flexible enough to accommodate many different use-cases. In the example request, an identity is giving itself an attribute describing its current email address, and writing that entry to its own identity chain.
    /// - Parameter receiverChainId: the Chain ID for the identity being assigned the attribute
    /// - Parameter destinationChainId: the Chain ID where the attribute entry will be written. Could be any existing chain, dream big.
    /// - Parameter attributes: the array of attributes that you are assigning to the receiver
    /// - Parameter signerKey: the public identity key being used to sign the entry. Must be stored in the wallet already and should be a currently valid key for the signer identity.
    /// - Parameter signerChainId: the Identity Chain of the signing party (who is giving the attribute)
    /// - Parameter ecpub: pass a string
    /// - Parameter force: pass a boolean
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeIdentityAttribute(receiverChainId:String, destinationChainId:String, attributes:[String:Any], signerKey:String, signerChainId:String, ecpub:String, force:Bool, completion:@escaping ((_ model:ComposeModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "compose-identity-attribute"
        self.params["params"] = ["receiver-chainid":receiverChainId, "destination-chainid":destinationChainId, "attributes":attributes, "signerkey":signerKey, "signer-chainid":signerChainId, "ecpub":ecpub, "force":force]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ComposeModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// This method helps you endorse an attribute that has already been registered on the Factom blockchain. To do this, you’ll need to create a structured entry on to the Identity chain. The compose-identity-attribute-endorsement method will return the API calls needed to create that entry. If the wallet is encrypted, it must be unlocked prior to using this command.
    /// - Parameter destinationChainId: the Chain ID where the attribute entry will be written. Could be any existing chain, dream big.
    /// - Parameter entryHash: the entry hash of the attribute that will be endorsed
    /// - Parameter signerKey: the public identity key being used to sign the entry. Must be stored in the wallet already and should be a currently valid key for the signer identity.
    /// - Parameter signerChainId: the Identity Chain of the signing party (who is endorsing the attribute located at entry-hash)
    /// - Parameter ecpub: pass a string
    /// - Parameter force: pass a boolean
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeIdentityAttributeEndorsement(destinationChainId:String, entryHash:String, signerKey:String, signerChainId:String, ecpub:String, force:Bool, completion:@escaping ((_ model:ComposeModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "compose-identity-attribute-endorsement"
        self.params["params"] = ["destination-chainid":destinationChainId, "entry-hash":entryHash, "signerkey":signerKey, "signer-chainid":signerChainId, "ecpub":ecpub, "force":force]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ComposeModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// The compose-identity-chain method will return the appropriate API calls to create an identity chain in factom. The chain will be constructed based on the name and public keys that you send in the request. The response you receive is similar to the compose-chain response.
    /// - Parameter names: pass an array of names
    /// - Parameter pubkeys: pass an array of pubkeys
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeIdentityChain(names:[String], pubkeys:[String] ,completion:@escaping ((_ model:ComposeModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "compose-identity-chain"
        self.params["params"] = ["name":names, "pubkeys":pubkeys]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ComposeModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Replacing one of an identity’s keys is done by adding a structured entry onto the identity’s chain. This will need to be done if you feel that a key was compromised or has been in use for too long.
    /// - Parameter chainId: the ChainID of the identity chain in question
    /// - Parameter oldkey: the public identity key for the level to be replaced
    /// - Parameter newkey: the public identity key that will be replacing oldkey
    /// - Parameter signerkey: the public identity key that will sign the entry and authorize the replacement. This key must be stored in the wallet already and must be of the same or higher priority than the oldkey in the context of the given Identity Chain.
    /// - Parameter ecpub: pass a string
    /// - Parameter force: pass a boolean
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeIdentityKeyReplacement(chainId:String, oldkey:String, newkey:String, signerkey:String, ecpub:String, force:Bool, completion:@escaping ((_ model:ComposeModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "compose-identity-key-replacement"
        self.params["params"] = ["chainid":chainId, "oldkey":oldkey, "signerkey":signerkey, "newkey":newkey, "ecpub":ecpub, "force":force]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ComposeModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Compose transaction marshals the transaction into a hex encoded string.
    /// - Parameter txName: transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func composeTransaction(txName:String ,completion:@escaping ((_ model:ComposeTransactionModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "compose-transaction"
        self.params["params"] = ["tx-name":txName]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = ComposeTransactionModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// ‌Deletes a working transaction in the wallet. The full transaction will be returned, and then deleted.‌
    /// - Parameter txName: transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func deleteTransaction(txName:String ,completion:@escaping ((_ model:DeleteTransactionModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "delete-transaction"
        self.params["params"] = ["tx-name":txName]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = DeleteTransactionModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Create a new Entry Credit Address and store it in the wallet.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func generateEcAddress(completion:@escaping ((_ model:AddressModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "generate-ec-address"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AddressModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// ‌Create a new Entry Credit Address and store it in the wallet.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func generateFactoidAddress(completion:@escaping ((_ model:AddressModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "generate-factoid-address"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AddressModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// ‌Creates a new identity key and adds it to the wallet.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func generateIdentityKey(completion:@escaping ((_ model:AddressModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "generate-identity-key"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AddressModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Get the current hight of blocks that have been cached by the wallet while syncing.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func getHeight(completion:@escaping ((_ model:GetHeightModel?, _ error:GenError?) -> Void)) {
           
           self.params["method"] = "get-height"
           
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = GetHeightModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }

           }
       }
    
    
    /// Given an identity public key as input, this method will respond with the corresponding public/private key pair from the wallet.
    /// - Parameter publicKey: pass a public key
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func identityKey(publicKey:String ,completion:@escaping ((_ model:AddressModel?, _ error:GenError?) -> Void)) {
        self.params["method"] = "identity-key"
        self.params["params"] = ["public":publicKey]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AddressModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }

        }
    }
    
    
    /// Import Factoid and/or Entry Credit address secret keys into the wallet.‌
    /// - Parameter addresses: pass a array of dictionary
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func importAddress(addresses:[[String:String]], completion:@escaping ((_ model:AllAddressesModel?, _ error:GenError?) -> Void)) {
           
           self.params["method"] = "import-addresses"
        self.params["params"] = ["addresses":addresses]
           
           ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
               if let result = response?.result {
                   let model = AllAddressesModel(JSON: result)
                   completion(model!, nil)
               }
               else if let error = response?.error {
                   completion(nil, error)
               }

           }
       }
    
    /// Allows a user to add one or more identity keys to the wallet. Using the secret keys as input, the command will return the corresponding key pairs that were imported.
    /// - Parameter addresses: pass a array of dictionary
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func importIdentityKeys(keys:[[String:String]], completion:@escaping ((_ model:AllIdentityKeysModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "import-identity-keys"
     self.params["params"] = ["keys":keys]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AllIdentityKeysModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// ‌Import a Koinify crowd sale address into the wallet.
    /// - Parameter words: pass a string of many different words
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func importKoinify(words:String, completion:@escaping ((_ model:AddressModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "import-koinify"
        self.params["params"] = ["words":words]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = AddressModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// This will create a new transaction.
    ///  The txid is in flux until the final transaction is signed.
    ///  Until then, it should not be used or recorded
    /// - Parameter txName: pass a transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func newTransaction(txName:String, completion:@escaping ((_ model:NewTransactionModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "new-transaction"
        self.params["params"] = ["tx-name":txName]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = NewTransactionModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieve current properties of factom-walletd, including the wallet and wallet API versions.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func properties(completion:@escaping ((_ model:PropertiesModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "properties"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = PropertiesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Be careful using this function! Ensure that you have backups of important keys before removing them. Given a factoid or entry-credit address, this command deletes the corresponding key pair from the wallet. Once executed, the user will no longer be able to retrieve the private key or make transactions with the address from this wallet.
    /// - Parameter address: pass an address
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func removeAddress(address:String, completion:@escaping ((_ model:RemoveAddressModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "remove-address"
        self.params["params"] = ["address":address]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = RemoveAddressModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Be careful using this function! Ensure that you have backups of important keys before removing them. Given an identity public key, this command deletes the corresponding identity key pair from the wallet. Once executed, the user will no longer be able to retrieve that key pair or sign attributes/endorsements with the key pair from this wallet.
    /// - Parameter address: pass a public key
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func removeIdentityKey(publicKey:String, completion:@escaping ((_ model:RemoveIdentityKeyModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "remove-identity-key"
        self.params["params"] = ["public":publicKey]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = RemoveIdentityKeyModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    ///Sign arbitrary data using a secret key stored in the wallet using ed25519 signatures. signer can be a human readable Factoid Address (FA), Entry Credit Address (EC), or Identity Key (idpub). data is a base64-encoded string
    /// - Parameter signer: pass signer as string
    /// - Parameter data: pass a base64-encoded strings
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func signData(signer:String, data:String,completion:@escaping ((_ model:SignDataModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "sign-data"
        self.params["params"] = ["signer":signer, "data":data]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = SignDataModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    /// Signs the transaction. It is now ready to be executed.‌
    /// - Parameter txName: pass a transaction name of type string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func signTransaction(txName:String, completion:@escaping ((_ model:SignTransactionModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "sign-transaction"
     self.params["params"] = ["tx-name":txName]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = SignTransactionModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    
    /// Using sub fee, you can use the receiving address in the parameters, and the fee will be deducted from their output amount.‌
    /// - Parameter txName: pass a transaction name of type string
    /// - Parameter address: pass a string
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func subFee(txName:String, address:String, completion:@escaping ((_ model:SubFeeModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "sub-fee"
        self.params["params"] = ["tx-name":txName,"address":address]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = SubFeeModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// ‌Lists all the current working transactions in the wallet. These are transactions that are not yet sent
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func tempTransactions(completion:@escaping ((_ model:TmpTransactionsModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "temp-transactions"
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = TmpTransactionsModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// This will retrieve all transactions within a given block height range.‌
    /// - Parameter start: starting point of type Int
    /// - Parameter end: end point of type Int
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func transactionUsingRange(start:Int, end:Int, completion:@escaping ((_ model:TransactionsModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "transactions"
        self.params["params"] = ["range":["start":start, "end":end]]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = TransactionsModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// This will retrieve a transaction by the given TxID.
    ///  This call is the fastest way to retrieve a transaction, but it will not display the height of the transaction.
    ///  If a height is in the response, it will be 0. To retrieve the height of a transaction, use the 'By Address’ method‌
    /// - Parameter txId: transactionId of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func transactionById(txId:String, completion:@escaping ((_ model:TransactionsModelById?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "transactions"
        self.params["params"] = ["txid":txId]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = TransactionsModelById(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Retrieves all transactions that involve a particular address
    /// - Parameter address: pass address of type String
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func transactionByAddress(address:String, completion:@escaping ((_ model:TransactionsModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "transactions"
        self.params["params"] = ["address":address]
        
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = TransactionsModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
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
    
    /// Unlocks this wallet for the amount of time specified in seconds by timeout. The
    /// - Parameter passPhrase: pass a phrase as string
    /// - Parameter timeout: timeout as Int in seconds
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func unlockWallet(passPhrase:String, timeout:Int, completion:@escaping ((_ model:UnlockWalletModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "unlock-wallet"
        self.params["params"] = ["passphrase":passPhrase, "timeout":timeout]
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = UnlockWalletModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// Return the wallet seed and all addresses in the wallet for backup and offline storage.‌
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func walletBackup(completion:@escaping ((_ model:WalletBackupModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "wallet-backup"
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = WalletBackupModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
        }
    }
    
    
    /// The wallet-balances API is used to query the acknowledged and saved balances for all addresses in the currently running factom-walletd.
    /// - Parameter completion: give response of type jsonObject  if successful and error if request falis
    public func walletBalances(completion:@escaping ((_ model:WalletBalancesModel?, _ error:GenError?) -> Void)) {
        
        self.params["method"] = "wallet-balances"
        ApiManager.shared.httpRequest(urlString: factomWalletdUrl, params: params) { (response, error) in
            if let result = response?.result {
                let model = WalletBalancesModel(JSON: result)
                completion(model!, nil)
            }
            else if let error = response?.error {
                completion(nil, error)
            }
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
