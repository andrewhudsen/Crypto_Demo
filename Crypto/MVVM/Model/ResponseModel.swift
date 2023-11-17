//
//  ResponseModel.swift
//  Crypto
//
//  Created by Andrew on 17/11/23.
//

import Foundation

struct ResponseModel : Codable {
    let status : Status?
    var data : [Data]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Status.self, forKey: .status)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }

}

struct Status : Codable {
    let timestamp : String?
    let error_code : Int?
    let error_message : String?
    let elapsed : Int?
    let credit_count : Int?
    let notice : String?
    let total_count : Int?

    enum CodingKeys: String, CodingKey {

        case timestamp = "timestamp"
        case error_code = "error_code"
        case error_message = "error_message"
        case elapsed = "elapsed"
        case credit_count = "credit_count"
        case notice = "notice"
        case total_count = "total_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
        error_code = try values.decodeIfPresent(Int.self, forKey: .error_code)
        error_message = try values.decodeIfPresent(String.self, forKey: .error_message)
        elapsed = try values.decodeIfPresent(Int.self, forKey: .elapsed)
        credit_count = try values.decodeIfPresent(Int.self, forKey: .credit_count)
        notice = try values.decodeIfPresent(String.self, forKey: .notice)
        total_count = try values.decodeIfPresent(Int.self, forKey: .total_count)
    }

}

struct Data : Codable {
    let id : Int?
    let name : String?
    let symbol : String?
    let slug : String?
    let num_market_pairs : Int?
    let date_added : String?
    let tags : [String]?
    let max_supply : Int?
    let circulating_supply : Double?
    let total_supply : Double?
    let infinite_supply : Bool?
    let platform : Platform?
    let cmc_rank : Int?
    let self_reported_circulating_supply : Double?
    let self_reported_market_cap : Double?
    let tvl_ratio : Double?
    let last_updated : String?
    let quote : Quote?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case symbol = "symbol"
        case slug = "slug"
        case num_market_pairs = "num_market_pairs"
        case date_added = "date_added"
        case tags = "tags"
        case max_supply = "max_supply"
        case circulating_supply = "circulating_supply"
        case total_supply = "total_supply"
        case infinite_supply = "infinite_supply"
        case platform = "platform"
        case cmc_rank = "cmc_rank"
        case self_reported_circulating_supply = "self_reported_circulating_supply"
        case self_reported_market_cap = "self_reported_market_cap"
        case tvl_ratio = "tvl_ratio"
        case last_updated = "last_updated"
        case quote = "quote"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        num_market_pairs = try values.decodeIfPresent(Int.self, forKey: .num_market_pairs)
        date_added = try values.decodeIfPresent(String.self, forKey: .date_added)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        max_supply = try values.decodeIfPresent(Int.self, forKey: .max_supply)
        circulating_supply = try values.decodeIfPresent(Double.self, forKey: .circulating_supply)
        total_supply = try values.decodeIfPresent(Double.self, forKey: .total_supply)
        infinite_supply = try values.decodeIfPresent(Bool.self, forKey: .infinite_supply)
        platform = try values.decodeIfPresent(Platform.self, forKey: .platform)
        cmc_rank = try values.decodeIfPresent(Int.self, forKey: .cmc_rank)
        self_reported_circulating_supply = try values.decodeIfPresent(Double.self, forKey: .self_reported_circulating_supply)
        self_reported_market_cap = try values.decodeIfPresent(Double.self, forKey: .self_reported_market_cap)
        tvl_ratio = try values.decodeIfPresent(Double.self, forKey: .tvl_ratio)
        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
        quote = try values.decodeIfPresent(Quote.self, forKey: .quote)
    }

}

struct Platform:Codable {
    let id: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let token_address: String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case symbol = "symbol"
        case slug = "slug"
        case token_address = "token_address"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        token_address = try values.decodeIfPresent(String.self, forKey: .token_address)
    }
}

struct Quote : Codable {
    let uSD : USD?

    enum CodingKeys: String, CodingKey {

        case uSD = "USD"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uSD = try values.decodeIfPresent(USD.self, forKey: .uSD)
    }

}

struct USD : Codable {
    let price : Double?
    let volume_24h : Double?
    let volume_change_24h : Double?
    let percent_change_1h : Double?
    let percent_change_24h : Double?
    let percent_change_7d : Double?
    let percent_change_30d : Double?
    let percent_change_60d : Double?
    let percent_change_90d : Double?
    let market_cap : Double?
    let market_cap_dominance : Double?
    let fully_diluted_market_cap : Double?
    let tvl : Double?
    let last_updated : String?

    enum CodingKeys: String, CodingKey {

        case price = "price"
        case volume_24h = "volume_24h"
        case volume_change_24h = "volume_change_24h"
        case percent_change_1h = "percent_change_1h"
        case percent_change_24h = "percent_change_24h"
        case percent_change_7d = "percent_change_7d"
        case percent_change_30d = "percent_change_30d"
        case percent_change_60d = "percent_change_60d"
        case percent_change_90d = "percent_change_90d"
        case market_cap = "market_cap"
        case market_cap_dominance = "market_cap_dominance"
        case fully_diluted_market_cap = "fully_diluted_market_cap"
        case tvl = "tvl"
        case last_updated = "last_updated"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        volume_24h = try values.decodeIfPresent(Double.self, forKey: .volume_24h)
        volume_change_24h = try values.decodeIfPresent(Double.self, forKey: .volume_change_24h)
        percent_change_1h = try values.decodeIfPresent(Double.self, forKey: .percent_change_1h)
        percent_change_24h = try values.decodeIfPresent(Double.self, forKey: .percent_change_24h)
        percent_change_7d = try values.decodeIfPresent(Double.self, forKey: .percent_change_7d)
        percent_change_30d = try values.decodeIfPresent(Double.self, forKey: .percent_change_30d)
        percent_change_60d = try values.decodeIfPresent(Double.self, forKey: .percent_change_60d)
        percent_change_90d = try values.decodeIfPresent(Double.self, forKey: .percent_change_90d)
        market_cap = try values.decodeIfPresent(Double.self, forKey: .market_cap)
        market_cap_dominance = try values.decodeIfPresent(Double.self, forKey: .market_cap_dominance)
        fully_diluted_market_cap = try values.decodeIfPresent(Double.self, forKey: .fully_diluted_market_cap)
        tvl = try values.decodeIfPresent(Double.self, forKey: .tvl)
        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
    }

}
