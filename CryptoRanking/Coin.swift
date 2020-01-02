//
//  Coin.swift
//  CryptoRanking
//
//  Created by MCS on 12/20/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct Coin {
  var name: String
  var rank: Int
  var description: String?
  var symbol: String?
  var color: String?
  var websiteUrl: String?
  var price: String
  
  init(name: String, rank: Int, description: String?, symbol: String?, color: String?, websiteUrl: String?, price: String) {
    self.name = name
    self.rank = rank
    self.description = description
    self.symbol = symbol
    self.color = color
    self.websiteUrl = websiteUrl
    self.price = price
  }
}

extension Coin: Decodable {
  enum CoinCodingKeys: CodingKey {
    case name
    case rank
    case description
    case symbol
    case color
    case websiteUrl
    case price
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CoinCodingKeys.self)
    let name: String = try container.decode(String.self, forKey: .name)
    let rank: Int = try container.decode(Int.self, forKey: .rank)
    let price: String = try container.decode(String.self, forKey: .price)

    if let description: String = try container.decode(String?.self, forKey: .description),
       let symbol: String = try container.decode(String?.self, forKey: .symbol),
       let color: String = try container.decode(String?.self, forKey: .color),
       let websiteUrl: String = try container.decode(String?.self, forKey: .websiteUrl) {
      self.init(name: name, rank: rank, description: description, symbol: symbol, color: color, websiteUrl: websiteUrl, price: price)
    } else {
      self.init(name: name, rank: rank, description: nil, symbol: nil, color: nil, websiteUrl: nil, price: price)
    }
  }
}
