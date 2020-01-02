//
//  CoinsData.swift
//  CryptoRanking
//
//  Created by MCS on 1/2/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import Foundation

struct CoinsData {
  var coins: [Coin]
  
  init(coins: [Coin]) {
    self.coins = coins
  }
}

extension CoinsData: Decodable {
  
  enum CoinsDataCodingKeys: String, CodingKey {
    case coins
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CoinsDataCodingKeys.self)
    let coins: [Coin] = try container.decode([Coin].self, forKey: .coins)
    
    self.init(coins: coins)
  }
}
