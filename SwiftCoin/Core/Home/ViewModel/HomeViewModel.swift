//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/18/1401 AP.
//
//
//
//
import SwiftUI

class HomeViewModel : ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    @Published var isLoadingData = true
    init () {
        fetchCoinData()
    }
    func fetchCoinData () {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) {data , response , error in
            
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                self.isLoadingData = false
            }
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response Code \(response.statusCode)")
            }
            guard let data = data else { return }
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                 
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMOvingCoins()
                    self.isLoadingData = false
                }
               
            } catch let error {
                print("DEBUG: failed to decode with error: \(error)")
                self.isLoadingData = false
            }
            
        }.resume()
        
        
    }
    func configureTopMOvingCoins() {
        let topMovers = coins.sorted { item1, item2 in
            return (item1.priceChangePercentage24H ?? 0 > item2.priceChangePercentage24H ?? 0)
        }
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
