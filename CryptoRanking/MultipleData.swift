//
//  MultipleData.swift
//  CryptoRanking
//
//  Created by MCS on 1/2/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import Foundation

struct MultipleData {
  var coinsData: CoinsData
  
  init(coinsData: CoinsData) {
    self.coinsData = coinsData
  }
}

extension MultipleData: Decodable {
  
  enum DataCodingKeys: String, CodingKey {
    case data
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: DataCodingKeys.self)
    let coinsData: CoinsData = try container.decode(CoinsData.self, forKey: .data)
    self.init(coinsData: coinsData)
  }
}
