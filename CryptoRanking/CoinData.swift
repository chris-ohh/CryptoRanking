//
//  Data.swift
//  CryptoRanking
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct CoinData {
  var coin: Coin
  
  init(coin: Coin) {
    self.coin = coin
  }
}

extension CoinData: Decodable {
  
  enum CoinDataCodingKeys: String, CodingKey {
    case coin
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CoinDataCodingKeys.self)
    let coin: Coin = try container.decode(Coin.self, forKey: .coin)
    
    self.init(coin: coin)
  }
}
