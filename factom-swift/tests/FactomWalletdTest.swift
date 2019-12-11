//
//  FactomWalletdTest.swift
//  factom-swift
//
//  Created by Sergey Bushnyak on 31/10/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import UIKit
///Always import the below frameworks to make use of the factom
//import Alamofire
//import factom_swift

class FactomWalletdTest: UIViewController {

    //MARK: - Properties
    
    ///create an instance of Config class by passing the parameters to constructor
    /// change the host, port ,walletdPort as you want
    let config = Config.init(host: "http://abc.com", port: "8000", walletdPort: "8009")
    
    var factomWalletd:FactomWalletdService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //initialize factomWalletd
        self.factomWalletd = FactomWalletdService.init(config: config)
        
        self.executeAllMethods()
    }
    
    //MARK: - Methods
    
    //you can use all these methods seprately whereever you need it
    // calling all these methods in a single method is for example
    //you can call these methods from 'factomd' instance of FactomdService class.
    func executeAllMethods() {
        
        //compose chain
        factomWalletd.composeChain(extids: ["61626364", "31323334"], content: "3132333461626364", ecpub: "EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //composeEntry
        factomWalletd.composeEntry(chainId: "48e0c94d00bf14d89ab10044075a370e1f55bcb28b2ff16206d865e192827645", extids: ["cd90", "90cd"], content: "abcdef", ecpub: "EC2DKSYyRcNWf7RS963VFYgMExo1824HVeCfQ9PGPmNzwrcmgm2r") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //composeTransaction
        factomWalletd.composeTransaction(txName: "test1") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //composeIdentityAttribute
        factomWalletd.composeIdentityAttribute(receiverChainId: "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae", destinationChainId: "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae", attributes: ["key":"email","value":"hello@factom.com"], signerKey: "idpub2cw4NS4JZowXTwhGeo2tTGNvnjc5n2QvHBURdvVFCKRDuLEnBh", signerChainId: "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae", ecpub: "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4", force: false) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //composeIdentityAttributeEndorsement
        factomWalletd.composeIdentityAttributeEndorsement(destinationChainId: "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae", entryHash: "c07f1d89bb6c43e7e3166b9e53672110ff8077c367758fbe4265561c8b91e675", signerKey: "idpub2cw4NS4JZowXTwhGeo2tTGNvnjc5n2QvHBURdvVFCKRDuLEnBh", signerChainId: "2321663B3B8A09CB4E701B84DEE49ABCE3C9D3EFDE867A9875E536D5ECEB653C", ecpub: "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4", force: false) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //composeIdentityChain
        factomWalletd.composeIdentityChain(names: ["Factom","Test","Identity"], pubkeys: ["idpub2k8zGYQUfekxehyUKeqPw6QPiJ5hkV3bbc9JBgL7GNrEiqMpQX","idpub2GU1Pcax2PibH8hHZg58fKRiSJKQWQkWYkpmt7VH1jCXBgqp9w","EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4","idpub3fXRj21gXveTk6RKYrpJniWV2pAanQktekEt62yhJUQXyPdvwL"]) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //compose-identity-key-replacement
        factomWalletd.composeIdentityKeyReplacement(chainId: "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae", oldkey: "idpub2GU1Pcax2PibH8hHZg58fKRiSJKQWQkWYkpmt7VH1jCXBgqp9w", newkey: "idpub2cw4NS4JZowXTwhGeo2tTGNvnjc5n2QvHBURdvVFCKRDuLEnBh", signerkey: "idpub2GU1Pcax2PibH8hHZg58fKRiSJKQWQkWYkpmt7VH1jCXBgqp9w", ecpub: "EC2ZFTmTv5Fs7UyKZzxY8km4jF635VkhR5KKBMzNP4BK4fPKaVw4", force: false) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //generate ec address
        factomWalletd.generateEcAddress { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        // generate factoid address
        factomWalletd.generateFactoidAddress { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //importKoinify
        factomWalletd.importKoinify(words: "yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow yellow") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }

        
        
        //address
        factomWalletd.address(address: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //allAddresses
        factomWalletd.allAddress { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //generateIdentityKey
        factomWalletd.generateIdentityKey { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //importIdentityKeys
        factomWalletd.importIdentityKeys(keys: [["secret":"idsec2rWrfNTD1x9HPPesA3fz8dmMNZdjmSBULHx8VTXE1J4D9icmAK"],["secret":"idsec1iuqCFoiEfSZ1rU2FNpa7oFY3Kc29hHxP1R2PDyacJQEA8iShB"]]) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //removeAddress
        factomWalletd.removeAddress(address: "EC3Pa3auBtWKwfkDT5VF2obEoioAJ8pTvftyQ3trURzWJfaAdUXc") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
    
        
        //removeIdentityKey
        factomWalletd.removeIdentityKey(publicKey: "idpub26PEBWuumVp19yUSpfGJ2HPrTrU7hgw5empU7FPiTHdCKoy5Ao") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
    
        //delete transaction
        factomWalletd.deleteTransaction(txName: "test1") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //sub-fee
        factomWalletd.subFee(txName: "test1", address: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
    
        
        //sign-transaction
        factomWalletd.signTransaction(txName: "test1") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //temp-transaction
        factomWalletd.tempTransactions { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //transactionsByRange
        factomWalletd.transactionUsingRange(start: 1, end: 10) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //transactionsByTxid
        factomWalletd.transactionById(txId: "914333898b4cd3a87091ced94d6276090a1a266e1f4b7578e2b036cfaf9aaf3e") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        
        //transactionsByAddress
        factomWalletd.transactionByAddress(address: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //all transactions
        factomWalletd.allTransactions { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        
        //all transactions
        factomWalletd.signData(signer: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q", data: "ZmFjdG9tIGlzIGdyZWF0") { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //get height
        factomWalletd.getHeight { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //get properties
        factomWalletd.properties { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //wallet-balances
        factomWalletd.walletBalances { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //unlockWallet
        factomWalletd.unlockWallet(passPhrase: "opensesame", timeout: 300) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //Errors
        factomWalletd.errors { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //active-identity-keys
        factomWalletd.activeIdentityKeys(chainId: "3b69dabe22c014af9a9bc9dfa7917ce4602a03579597ddf184d8de56702512ae", height: 163419) { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
        
        //allIdentityKeys
        factomWalletd.allIdentityKeys { (result, error) in
            if result != nil {
                print(result!)
            }else{
                print(error!.message)
            }
        }
    }
}
