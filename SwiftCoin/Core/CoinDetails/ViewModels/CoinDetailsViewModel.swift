//
//  CoinDetailsViewModel.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 9/2/1401 AP.
//

import Foundation
import SwiftUI

class CoinDetailsViewModel {
    
    private let coin: Coin
    // chart config
    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    
    var coinName: String {
        return coin.name
    }
    var chartLineColor: Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var OverViewSectionModel: CoinDetailSectionModel {
        // price state
        let price = coin.currentPrice.toCurrency()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStats = StatisticModel(title: "Current Price",
                                        value: price,
                                        percentageChange: pricePercentChange)
        // market cap state
        let marketCap = coin.marketCap
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapstat = StatisticModel(title: "Market Capitalization",
                                           value:marketCap.formattedwithAbbreviations() ,
                                           percentageChange: marketCapPercentChange)
        // rank state
        let rank = coin.marketCapRank
        let rankStat = StatisticModel(title: "Rank",
                                      value: "\(rank)",
                                      percentageChange: nil)
        //volume state
        let volume = coin.totalVolume 
        let volumeStat = StatisticModel(title: "Volume",
                                        value: volume.formattedwithAbbreviations(),
                                      percentageChange: nil)
        
        return CoinDetailSectionModel(title: "Overview", stats: [priceStats,
                                                                 marketCapstat,
                                                                 rankStat,
                                                                 volumeStat])
        
        
    }
    
    var additionalDetailsSectionModel: CoinDetailSectionModel {
        // 24H high
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = StatisticModel(title: "24H High",
                                      value: high,
                                      percentageChange: nil)
        // 24H  Low
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = StatisticModel(title: "24H Low",
                                      value: low,
                                      percentageChange: nil)
        // 24H  priceChange
        let priceChange24H = coin.priceChange24H?.toCurrency()
        let percentChange24H  = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24H Price Change",
                                             value: priceChange24H ?? "-",
                                             percentageChange: percentChange24H)
        // 24H market cap change
        let marketCapChange = coin.marketCapChange24H ?? 0
        let marketCapChangePercent = coin.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24H Market Cap Change",
                                                 value: "$\(marketCapChange.formattedwithAbbreviations())",
                                                 percentageChange: marketCapChangePercent)
        
        return CoinDetailSectionModel(title: "Additional Details", stats: [highStat,
                                                                           lowStat,
                                                                           priceChangeStat,
                                                                           marketCapChangeStat])
        
        
    }
    
    init(coin: Coin) {
        self.coin = coin
        configuraChartData()
        print("DEBUG: Coin is \(self.coinName)")
    }
    
    func configuraChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return }
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!

        self.endDate = Date(coinGeckoString: coin.lastUpdated )
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.yAxisValues = [minPrice, (minPrice + maxPrice) / 2 ,maxPrice ]
        self.xAxisValues = [startDate, endDate]

        for price in priceData.reversed() {
            
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            
            let chartDataItem = ChartData(date: date, value: price)
            self.chartData.append(chartDataItem)
            index += 1
        }
    }
    
    
    
}
