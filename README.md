# factom-swift

# Implementation
    clone this repo on your project root path
    git clone https://gitlab.com/kompendium/factom-swift.git

# Config
    You can change default node url or ports
    import factoms_swift
    let config = Config.init(host: "http://abc.com", port: "8000", walletdPort: "8009")

# Usage
# Retreiving a balance
    import factoms_swift
    self.factomd = FactomdService.init(config: config)
    
    /// get ec address balance
    self.factomd.entryCreditBalance(address: "EC2dTBH2Nc9t9Y7RFD3FYMN5ottoPeHdk6xqUWEc6eHVoBPj6CmH") 
    { (result, error) in
        if result != nil 
        {
        print(result!)
        }else
        {
           print(error!.localizedDescription)
        }
    }
    
# Writing an Entry
    import factoms_swift
    self.factomd = FactomdService.init(config: config)
    
    //commit entry
        self.factomd.commitChain(message: "00015507C1024BF5C956749FC3EBA4ACC60FD485FB100E601070A44FCCE54FF358D60669854734013B6A27BCCEB6A42D62A3A8D02A6F0D73653215771DE243A63AC048A18B59DA29F4CBD953E6EBE684D693FDCA270CE231783E8ECC62D630F983CD59E559C6253F84D1F54C8E8D8665D493F7B4A4C1864751E3CDEC885A64C2144E0938BF648A00") 
        { (result, error) in
            if result != nil 
            {
                print(result!)
            }else
            {
                print(error!.localizedDescription)
            }
        }
    
    // reveal chain
        self.factomd.revialChain(entry: "007E18CCC911F057FB111C7570778F6FDC51E189F35A6E6DA683EC2A264443531F000E0005746573745A0005746573745A48656C6C6F20466163746F6D21") 
        { (result, error) in
            if result != nil 
            {
                print(result!)
            }else
            {
                print(error!.localizedDescription)
            }
        }
    
# Block Height and Current Minute
    import factoms_swift
    self.factomd = FactomdService.init(config: config)
    
    //fblockByHeight
        self.factomd.heights 
        { (result, error) in
            if result != nil 
            {
                print(result!)
            }else
            {
                print(error!.localizedDescription)
            }
        }
    
    //get current minute
        self.factomd.currentTime 
        { (result, error) in
            if result != nil 
            {
                print(result!)
            }else
            {
                print(error!.localizedDescription)
            }
        }

# get transaction

    import factoms_swift
    self.factomd = FactomdService.init(config: config)
    
    /// get transaction list
        self.factomd.pendingTransactions(address: "FA2jK2HcLnRdS94dEcU27rF3meoJfpUcZPSinpb7AwQvPRY6RL1Q") 
        { (result, error) in
            if result != nil 
            {
                print(result!)
            }else{
                print(error!.localizedDescription)
            }
        }
        
        /// get transaction
        self.factomd.transaction(hash: "64251aa63e011f803c883acf2342d784b405afa59e24d9c5506c84f6c91bf18b") 
        { (result, error) in
            if result != nil 
            {
                print(result!)
            }else
            {
                print(error!.localizedDescription)
            }
        }

# Testing
    swift tests/FactomdTest.swift
    swift tests/FactomWalletdTest.swift
    swift tests/DebugTest.swift
    
[Factomd](factoms-swift/tests/FactomdTest.swift)

[Factom Walletd](factoms-swift/tests/FactomWalletdTest.swift)

[Debug](factoms-swift/tests/DebugTest.swift)
    
    
    
    
    

