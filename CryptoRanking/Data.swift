//
//  Data.swift
//  CryptoRanking
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct Data {
  var coinData: CoinData
  
  init(coinData: CoinData) {
    self.coinData = coinData
  }
}

extension Data: Decodable {
  
  enum DataCodingKeys: String, CodingKey {
    case data
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: DataCodingKeys.self)
    let coinData: CoinData = try container.decode(CoinData.self, forKey: .data)
    
    self.init(coinData: coinData)
  }
}
