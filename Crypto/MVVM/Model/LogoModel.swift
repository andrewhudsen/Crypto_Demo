//
//  LogoModel.swift
//  Crypto
//
//  Created by Andrew on 17/11/23.
//

import Foundation

struct LogoModel : Codable {
    let status : Status?
    let data : [String:LogoData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Status.self, forKey: .status)
        data = try values.decodeIfPresent([String:LogoData].self, forKey: .data)
    }

}

struct LogoData:Codable {
    let id: Int?
        let name, symbol: String?
        let category: String?
        let slug: String?
        let logo: String?
        let subreddit: String?
        let tagNames: [String]?
        let tagGroups: [String]?
        let twitterUsername: String?
        let isHidden: Int?
        let dateLaunched: String?
        let contractAddress: [ContractAddress]?
        let selfReportedCirculatingSupply: Double?
        let selfReportedTags: [String]?
        let selfReportedMarketCap: Double?
        let infiniteSupply: Bool?

        enum CodingKeys: String, CodingKey {
            case id, name, symbol, category, slug, logo, subreddit
            case tagNames = "tag-names"
            case tagGroups = "tag-groups"
            case twitterUsername = "twitter_username"
            case isHidden = "is_hidden"
            case dateLaunched = "date_launched"
            case contractAddress = "contract_address"
            case selfReportedCirculatingSupply = "self_reported_circulating_supply"
            case selfReportedTags = "self_reported_tags"
            case selfReportedMarketCap = "self_reported_market_cap"
            case infiniteSupply = "infinite_supply"
        }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        subreddit = try values.decodeIfPresent(String.self, forKey: .subreddit)
        tagNames = try values.decodeIfPresent([String].self, forKey: .tagNames)
        tagGroups = try values.decodeIfPresent([String].self, forKey: .tagGroups)
        twitterUsername = try values.decodeIfPresent(String.self, forKey: .twitterUsername)
        isHidden = try values.decodeIfPresent(Int.self, forKey: .isHidden)
        dateLaunched = try values.decodeIfPresent(String.self, forKey: .dateLaunched)
        contractAddress = try values.decodeIfPresent([ContractAddress].self, forKey: .contractAddress)
        selfReportedCirculatingSupply = try values.decodeIfPresent(Double.self, forKey: .selfReportedCirculatingSupply)
        selfReportedTags = try values.decodeIfPresent([String].self, forKey: .selfReportedTags)
        selfReportedMarketCap = try values.decodeIfPresent(Double.self, forKey: .selfReportedMarketCap)
        infiniteSupply = try values.decodeIfPresent(Bool.self, forKey: .infiniteSupply)
    }
}

struct ContractAddress:Codable {
    let contractAddress : String?
    let platform : LogoPlatform?
    
    enum CodingKeys: String, CodingKey {
        case contractAddress = "contract_address"
        case platform = "platform"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        contractAddress = try values.decodeIfPresent(String.self, forKey: .contractAddress)
        platform = try values.decodeIfPresent(LogoPlatform.self, forKey: .platform)
    }
}

struct LogoPlatform : Codable {
    let name : String?
    let coin : Coin?
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case coin = "coin"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        coin = try values.decodeIfPresent(Coin.self, forKey: .coin)
    }
}
struct Coin : Codable {
    let id : String?
    let name : String?
    let symbol : String?
    let slug : String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case symbol = "symbol"
        case slug = "slug"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
    }
}
