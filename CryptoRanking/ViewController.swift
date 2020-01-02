//
//  ViewController.swift
//  CryptoRanking
//
//  Created by MAC on 12/13/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var coins: [Coin?] = []
  var coinsData: CoinsData? = nil
  var data: MultipleData? = nil
//
//  var coin: Coin? = nil
//  var coinData: CoinData? = nil
//  var data: Data? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    URLSession.shared.dataTask(with: URL(string: "https://api.coinranking.com/v1/public/coins")!) { (data, _, _) in
      
//      if let data = data {
//        try! self.data = JSONDecoder().decode(Data.self, from: data)
//        self.coinData = self.data?.coinData
//        self.coin = self.coinData?.coin
//      }
      
      if let data = data {
        try! self.data = JSONDecoder().decode(MultipleData.self, from: data)
        self.coinsData = self.data?.coinsData
        self.coins = (self.coinsData?.coins)!
      }
    }.resume()
  }
}

