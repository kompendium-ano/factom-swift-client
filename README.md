# Swift JSON-RPC client for Factom API
[![Build Status](https://travis-ci.com/kompendium-llc/factom-swift-client.svg?branch=master)](https://travis-ci.com/kompendium-llc/factom-swift-client)
[![Coverage Status](https://camo.githubusercontent.com/8fd98186cfaf7b8c5ded327bca8f17b68901aabb/68747470733a2f2f636f766572616c6c732e696f2f7265706f732f6769746875622f6a62656c6d6f6e742f636f6e7461696e6572697a65642d676f6c616e672d616e642d7675656a732f62616467652e7376673f6272616e63683d6d6173746572)](https://coveralls.io/github/kompendium-llc/factom-sift-client?branch=master)
![Cocoapods](https://img.shields.io/cocoapods/v/factom-swift-client)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/kompendium-llc/factom-swift/blob/master/LICENSE)

A JSON-RPC Swift client for the Factom protocol. Each response has unique type that automatically converted from JSON response and suitable for further usage in business logic. All responses are available in [Response](https://github.com/kompendium-llc/factom-swift-client/tree/master/factom-swift/Models) directory along with convinient converters.

## Installation

## Implementation
    clone this repo on your project root path
    git clone https://github.com/kompendium-llc/factom-swift-clietn.git

## Config
    You can change default node url or ports
    import factoms_swift
    let config = Config.init(host: "http://abc.com", port: "8000", walletdPort: "8009")

## Usage

We list several examples to provide better understanding on how to use library within your codebase.

### Retreiving a balance

```swift
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
```    

### Writing an Entry

```swift
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
```

### Block Height and Current Minute
```swift
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
```

### Getting transaction

```swift
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
```

## Testing
```bash
$ swift tests/FactomdTest.swift
$ swift tests/FactomWalletdTest.swift
$ swift tests/DebugTest.swift
```
[Factomd](factoms-swift/tests/FactomdTest.swift)

[Factom Walletd](factoms-swift/tests/FactomWalletdTest.swift)

[Debug](factoms-swift/tests/DebugTest.swift)
    
    
## Contributions

Please, feel free to contribute, fork the repo and submit PR.

Say thanks, send a tip:

- `btc`: 39oVXpsgsyW8ZgzsnX3sV7HLdtXWfT96qN
- `fct`: FA38cwer93mmPw1HxjScLmK1yF9iJTu5P87T2vdkbuLovm2YXyss
- `eth`: 0x9cDBA6bb44772259B3A3fb89cf233A147a720f34
- `xlm`: GD2FROTYXYSNOQQREYXHCXVOYWV556EM6PAHMVUHJNJEUYTUXUSNUZQ3

    
    
    

