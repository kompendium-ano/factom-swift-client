//
//  FactomdTest.swift
//  factoms-swift
//
//  Created by Aman Joshi on 31/10/19.
//  Copyright © 2019-2020 Kompendium, LLC. All rights reserved.
//

import UIKit
///Always import the below frameworks to make use of the factom
//import Alamofire
//import factoms_swift

class FactomdTest: UIViewController {

    //MARK: - Properties
    
    ///create an instance of Config class by passing the parameters to constructor
    /// change the host, port ,walletdPort as you want
    let config = Config.init(host: "http://abc.com", port: "8000", walletdPort: "8009")
    
    var factomd:FactomdService!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.factomd = FactomdService.init(config: config)
        
        self.executeAllMethods()
    }
    
    //MARK: - Methods
    
    //you can use all these methods seprately whereever you need it
    // calling all these methods in a single method is for example
    //you can call these methods from 'factomd' instance of FactomdService class.
    func executeAllMethods() {
        /// get ec address balance
        self.factomd.entryCreditBalance(address: "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH") { (model, error) in
            if model != nil {
                print(model!.balance)
            }else{
                print(error!.message)
            }
        }
        
        ///get factoid address balance
        self.factomd.factoidBalance(address: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q") { (model, error) in
            if model != nil {
                print(model!.balance)
            }else{
                print(error!.message)
            }
        }
        
        
        ///get multiple ec address balance
            self.factomd.multipleEcBalances(addresses: ["EC293AbTn3VScgC2m86xTh2kFKAMNnkgoLdXgywpPa66Jacom5ya","EC3ExcVhmGRJmavCf1LCMu8YiHCyU2CWVh5DmXRz6jfPHMbzJSCz"]) { (model, error) in
                if model != nil {
                    print(model!.currentHeight)
                }else{
                    print(error!.message)
                }
            }
        
        /// get multiple factoid address balance
        self.factomd.multipleFctBalances(addresses: ["FA3uMAv9htC5y5u3ayzxNQKZNDpgrJVf49kJSKdVNxcYoNBbSLXc","FA3umgJaXdHjpSQyBUPC2uMFuoW9nM5Ymm8Sa2f2VKGSqsyx79nf"]) { (model, error) in
            if model != nil {
                print(model!.lastSavedHeight)
            }else{
                print(error!.message)
            }
        }
        
        /// get transaction list
            self.factomd.pendingTransactions(address: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q") { (response, error) in
                if response != nil {
                    if let result = response!.result {
                        if let transactionid = result["transactionid"] {
                            print(transactionid)
                        }
                    }
                }else{
                    print(error!.localizedDescription)
                }
            }
        
        /// get transaction
        self.factomd.transaction(hash: "64251aa63e011f803c883acf2342d784b405afa59e24d9c5506c84f6c91bf18b") { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let factoidtransaction = result["factoidtransaction"] as? JSONObject {
                        if let millitimestamp = factoidtransaction["millitimestamp"] {
                            print(millitimestamp)
                        }
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        /// Get block height
        self.factomd.ablockByHeight(height: 1) { (model, error) in
            if model != nil {
                print(model!.ablock!.backreferencehash)
            }else{
                print(error!.message)
            }
        }
        
        //get block height
        self.factomd.ack(hash: "e96cca381bf25f6dd4dfdf9f7009ff84ee6edaa3f47f9ccf06d2787482438f4b", chainId: "f9164cd66af9d5773b4523a510b5eefb9a5e626480feeb6671ef2d17510ca300", fullTransaction: "") { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let committxid = result["committxid"] {
                        print(committxid)
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        //get admin-block
        self.factomd.adminBlock(keymr: "ee4793393cc7cb7c93b9f609a850e13976be24a16f4b2ce81fb4177df72a865b") { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let ablock = result["ablock"] as? JSONObject {
                        if let header = ablock["header"] as? JSONObject {
                            print(header["dbheight"]!)
                        }
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
        
        //retrieves a directory block given only its height
        self.factomd.dBlockByHeight(height: 14460) { (model, error) in
           if model != nil {
            print(model!.dblock!.keymr)
            }else{
                print(error!.message)
            }
        }
        
        //directory-block
        self.factomd.directoryBlock(keymr: "7ed5d5b240973676c4a8a71c08c0cedb9e0ea335eaef22995911bcdc0fe9b26b") { (model, error) in
            if model != nil {
                print(model!.header!.prevblockkeymr)
            }else{
                print(error!.message)
            }
        }
        
        // directory-block head
        self.factomd.directoryBlockHead { (model, error) in
            if model != nil {
                print(model!.keymr)
            }else{
                print(error!.message)
            }
        }
        
        
        // ec Block By Height
        self.factomd.ecBlockByHeight(height: 10000) { (response, error) in
            if response != nil {
                if let result = response!.result{
                    if let ecblock = result["ecblock"] as? JSONObject {
                        if let header = ecblock["header"] as? JSONObject {
                            print(header["ecchainid"]!)
                        }
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        //get chain head
        self.factomd.chainHead(chainId: "5a77d1e9612d350b3734f6282259b7ff0a3f87d62cfef5f35e91a5604c0490a3") { (model, error) in
            if model != nil {
                print(model!.chainHead)
            }else{
                print(error!.message)
            }
        }
        
        //commit chain
        self.factomd.commitChain(message: "00015507b2f70bd0165d9fa19a28cfaafb6bc82f538955a98c7b7e60d79fbf92655c1bff1c76466cb3bc3f3cc68d8b2c111f4f24c88d9c031b4124395c940e5e2c5ea496e8aaa2f5c956749fc3eba4acc60fd485fb100e601070a44fcce54ff358d606698547340b3b6a27bcceb6a42d62a3a8d02a6f0d73653215771de243a63ac048a18b59da2946c901273e616bdbb166c535b26d0d446bc69b22c887c534297c7d01b2ac120237086112b5ef34fc6474e5e941d60aa054b465d4d770d7f850169170ef39150b") { (model, error) in
            if model != nil {
                print(model!.chainId)
            }else{
                print(error!.message)
            }
        }
        
        // reveal chain
        self.factomd.revialChain(entry: "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21") { (model, error) in
            if model != nil {
                print(model!.entryhash)
            }else{
                print(error!.message)
            }
        }
        
        //commit entry
        self.factomd.commitEntry(message: "00015507C1024BF5C956749FC3EBA4ACC60FD485FB100E601070A44FCCE54FF358D60669854734013B6A27BCCEB6A42D62A3A8D02A6F0D73653215771DE243A63AC048A18B59DA29F4CBD953E6EBE684D693FDCA270CE231783E8ECC62D630F983CD59E559C6253F84D1F54C8E8D8665D493F7B4A4C1864751E3CDEC885A64C2144E0938BF648A00") { (model, error) in
            if model != nil {
                print(model!.txid)
            }else{
                print(error!.message)
            }
        }
        
        //get current minute
        self.factomd.currentTime { (model, error) in
            if model != nil {
                print(model!.leaderHeight)
            }else{
                print(error!.message)
            }
        }
        
        // reveal entry
        self.factomd.revealEntry(entry: "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21") { (model, error) in
           if model != nil {
            print(model!.chainid)
            }else{
                print(error!.message)
            }
        }
        
        //to check commit chain
        self.factomd.sendRawMessageToCheckCommit(message: "00016dcfa2434846e5259a21586d887816878126d2e1dd28d446a11d6ab7987f4dc78f2e4e5c17d763ad62244461094efc15bd4f1b2a899e01037416545862d9990806e17e5fe246310ceacb573703b7a8e7f59e11351a23ad48bc22062ff28246748e90231e980bfe58514d89325855ba189f585c259aaaa4b7a420b3c6704fe692cdd49cc4a9628f2383a36a95fe1ae2bc2314a5011605601ecf7858fbbbf8eb2388787d2cd680d8d90961f5760f94397733462e21cbaf1867ef85a68c671cc14e4bc4694cc102") { (model, error) in
            if model != nil {
                print(model!.message)
            }else{
                print(error!.message)
            }
        }
        
        //to check reveal chain
        self.factomd.sendRawMessageToCheckRevealChain(message: "00016dcfa2434846e5259a21586d887816878126d2e1dd28d446a11d6ab7987f4dc78f2e4e5c17d763ad62244461094efc15bd4f1b2a899e01037416545862d9990806e17e5fe246310ceacb573703b7a8e7f59e11351a23ad48bc22062ff28246748e90231e980bfe58514d89325855ba189f585c259aaaa4b7a420b3c6704fe692cdd49cc4a9628f2383a36a95fe1ae2bc2314a5011605601ecf7858fbbbf8eb2388787d2cd680d8d90961f5760f94397733462e21cbaf1867ef85a68c671cc14e4bc4694cc102") { (model, error) in
            if model != nil {
                print(model!.message)
            }else{
                print(error!.message)
            }
        }
        
        
        // get entry
        self.factomd.entry(hash: "b11bb4e1dacea726224c05bf863092ba02d301de55c08039f381e6e0ad1cef0d") { (model, error) in
            if model != nil {
                print(model!.extids[0])
            }else{
                print(error!.message)
            }
        }
        
        // entry-ack
        self.factomd.entryAck(txid: "9228b4b080b3cf94cceea866b74c48319f2093f56bd5a63465288e9a71437ee8") { (model, error) in
            if model != nil {
                print(model!.committxid)
            }else{
                print(error!.message)
            }
        }
        
        //entry-block
        self.factomd.entryBlock(keymr: "041c3fed14469a3d0f1a022e3d5321583065e691edb9223605c86766ff881883") { (model, error) in
            if model != nil {
                print(model!.header!.blockSequenceNumber)
            }else{
                print(error!.message)
            }
        }
        
        // entrycredit-block
        self.factomd.entryCreditBlock(keymr: "2050b16701f29238d6b99bcf3fb0ca55d6d884139601f06691fc370cda659d60") { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let ecblock = result["ecblock"] as? JSONObject {
                        if let header = ecblock["header"] as? JSONObject {
                            print(header["ecchainid"]!)
                        }
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        //entry-credit-rate
        self.factomd.entryCreditRate { (model, error) in
            if model != nil {
                print(model!.rate)
            }else{
                print(error!.message)
            }
        }
        
        //pending-entries
        self.factomd.pendingEntries { (model, error) in
            if model != nil {
                print(model!.id)
            }else{
                print(error!.message)
            }
        }
        
        // factoidAck
        self.factomd.factoidAck(txid: "f1d9919829fa71ce18caf1bd8659cce8a06c0026d3f3fffc61054ebb25ebeaa0") { (model, error) in
            if model != nil {
                print(model!.blockDateString)
            }else{
                print(error!.message)
            }
        }
        
        //factoid block
        self.factomd.factoidBlock(keymr: "1df843ee64f4b139047617a2df1007ea4470fabd097ddf87acabc39813f71480") { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let fblock = result["fblock"] as? JSONObject {
                        if let exchrate = fblock["exchrate"] {
                            print(exchrate)
                        }
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        //fblockByHeight
        self.factomd.fBlockByHeight(height: 1) { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let fblock = result["fblock"] as? JSONObject {
                        if let exchrate = fblock["exchrate"] {
                            print(exchrate)
                        }
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        //fblockByHeight
        self.factomd.heights { (model, error) in
            if model != nil {
                print(model!.entryBlockHeight)
            }else{
                print(error!.message)
            }
        }
        
        //properties
        self.factomd.properties { (model, error) in
            if model != nil {
                print(model!.factomdapiversion)
            }else{
                print(error!.message)
            }
        }
        
        //raw-data
        self.factomd.rawData(hash: "ee380f524689af957528c91e5674d0226744d19630fa45daec794f1d0c0c0222") { (model, error) in
            if model != nil {
                print(model!.data)
            }else{
                print(error!.message)
            }
        }
        
        //reciept
        self.factomd.receipt(hash: "2413a0f67e7dd988728f77020905829eef62ad06c0b7bf8e52a7e1455d5f3fb6") { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let receipt = result["receipt"] as? JSONObject {
                        if let entry = receipt["entry"] as? JSONObject {
                            print(entry["entryhash"]!)
                        }
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        //anchors
        self.factomd.anchors(hash: "2413a0f67e7dd988728f77020905829eef62ad06c0b7bf8e52a7e1455d5f3fb6") { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let directoryblockheight = result["directoryblockheight"] {
                        print(directoryblockheight)
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
        
        //diagnostics
        self.factomd.diagnostics { (response, error) in
            if response != nil {
                if let result = response!.result {
                    if let id = result["id"] {
                        print(id)
                    }
                }            }else{
                print(error!.localizedDescription)
            }
        }
    }
}
