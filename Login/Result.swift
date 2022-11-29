import Foundation

struct Result: Codable {
    
    var tokenAddress      : String? = nil
    var tokenId           : String? = nil
    var ownerOf           : String? = nil
    var blockNumber       : String? = nil
    var blockNumberMinted : String? = nil
    var tokenHash         : String? = nil
    var amount            : String? = nil
    var contractType      : String? = nil
    var name              : String? = nil
    var symbol            : String? = nil
    var tokenUri          : String? = nil
    var metadata          : String? = nil
    var lastTokenUriSync  : String? = nil
    var lastMetadataSync  : String? = nil
    var minterAddress     : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case tokenAddress      = "token_address"
        case tokenId           = "token_id"
        case ownerOf           = "owner_of"
        case blockNumber       = "block_number"
        case blockNumberMinted = "block_number_minted"
        case tokenHash         = "token_hash"
        case amount            = "amount"
        case contractType      = "contract_type"
        case name              = "name"
        case symbol            = "symbol"
        case tokenUri          = "token_uri"
        case metadata          = "metadata"
        case lastTokenUriSync  = "last_token_uri_sync"
        case lastMetadataSync  = "last_metadata_sync"
        case minterAddress     = "minter_address"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        tokenAddress      = try values.decodeIfPresent(String.self , forKey: .tokenAddress      )
        tokenId           = try values.decodeIfPresent(String.self , forKey: .tokenId           )
        ownerOf           = try values.decodeIfPresent(String.self , forKey: .ownerOf           )
        blockNumber       = try values.decodeIfPresent(String.self , forKey: .blockNumber       )
        blockNumberMinted = try values.decodeIfPresent(String.self , forKey: .blockNumberMinted )
        tokenHash         = try values.decodeIfPresent(String.self , forKey: .tokenHash         )
        amount            = try values.decodeIfPresent(String.self , forKey: .amount            )
        contractType      = try values.decodeIfPresent(String.self , forKey: .contractType      )
        name              = try values.decodeIfPresent(String.self , forKey: .name              )
        symbol            = try values.decodeIfPresent(String.self , forKey: .symbol            )
        tokenUri          = try values.decodeIfPresent(String.self , forKey: .tokenUri          )
        metadata          = try values.decodeIfPresent(String.self , forKey: .metadata          )
        lastTokenUriSync  = try values.decodeIfPresent(String.self , forKey: .lastTokenUriSync  )
        lastMetadataSync  = try values.decodeIfPresent(String.self , forKey: .lastMetadataSync  )
        minterAddress     = try values.decodeIfPresent(String.self , forKey: .minterAddress     )
        
    }
    
    init() {
        
    }
    
    
}
