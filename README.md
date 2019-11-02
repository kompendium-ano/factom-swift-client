# Factom Swift Client

JSON RPC client for Factom blockchain implemented in Swift

# Implementation
    clone this repo on your project root path
    git clone https://github.com/kompendium-llc/factom-swift-client.git

# Config
    You can change default node url or ports
    import factoms_swift
    let config = Config.init(host: "http://factomd.net", port: "8000", walletdPort: "8009")

# Usage
# Retreiving a balance
    import factoms_swift
    self.factomd = FactomdService.init(config: config)

    /// get ec address balance
    self.factomd.entryCreditBalance(address: "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH")
    { (response, error) in
        if response != nil
        {
        if let result = response!["result"] as? JSONObject {
            if let balance = result["balance"]
            {
                print(balance)
            }
        }else
        {
           print(error!.localizedDescription)
        }
    }

# Writing an Entry
    import factoms_swift
    self.factomd = FactomdService.init(config: config)

    //commit entry
        self.factomd.commitChain(message: "00015507b2f70bd0165d9fa19a28cfaafb6bc82f538955a98c7b7e60d79fbf92655c1bff1c76466cb3bc3f3cc68d8b2c111f4f24c88d9c031b4124395c940e5e2c5ea496e8aaa2f5c956749fc3eba4acc60fd485fb100e601070a44fcce54ff358d606698547340b3b6a27bcceb6a42d62a3a8d02a6f0d73653215771de243a63ac048a18b59da2946c901273e616bdbb166c535b26d0d446bc69b22c887c534297c7d01b2ac120237086112b5ef34fc6474e5e941d60aa054b465d4d770d7f850169170ef39150b") { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let txid = result["txid"]
                    {
                        print(txid)
                    }
                }
                }else
                {
                print(error!.localizedDescription)
            }
        }

    // reveal chain
        self.factomd.revialChain(entry: "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21") { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let chainid = result["chainid"] {
                        print(chainid)
                    }
                }
            }else
            {
                print(error!.localizedDescription)
            }
        }

# Block Height and Current Minute
    import factoms_swift
    self.factomd = FactomdService.init(config: config)

    //fblockByHeight
        self.factomd.heights { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let directoryblockheight = result["directoryblockheight"] {
                        print(directoryblockheight)
                    }
                }
            }else
            {
                print(error!.localizedDescription)
            }
        }

    //get current minute
        self.factomd.currentTime { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let leaderheight = result["leaderheight"] {
                        print(leaderheight)
                    }
                }
            }else
            {
                print(error!.localizedDescription)
            }
        }

# get transaction

    import factoms_swift
    self.factomd = FactomdService.init(config: config)

    /// get transaction list
        self.factomd.pendingTransactions(address: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q") { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
                    if let transactionid = result["transactionid"] {
                        print(transactionid)
                    }
                }
            }else
            {
                print(error!.localizedDescription)
            }
        }

        /// get transaction
        self.factomd.transaction(hash: "64251aa63e011f803c883acf2342d784b405afa59e24d9c5506c84f6c91bf18b") { (response, error) in
            if response != nil {
                if let result = response!["result"] as? JSONObject {
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

# Testing
    swift tests/FactomdTest.swift
    swift tests/FactomWalletdTest.swift
    swift tests/DebugTest.swift

[Factomd](factom-rpc/tests/FactomdTest.swift)

[Factom Walletd](factom-rpc/tests/FactomWalletdTest.swift)

[Debug](factom-rpc/tests/DebugTest.swift)
