//
//  CoinDetailsView.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/24/1401 AP.
//

import SwiftUI

struct CoinDetailsView: View {
      let viewModel: CoinDetailsViewModel
    
    init(coin: Coin) {
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            // chart
            ChartView(viewModel: viewModel)
                .frame(height: 250)
                .padding(.vertical)
                .shadow(color: viewModel.chartLineColor,
                        radius: 10)
                .shadow(color: viewModel.chartLineColor.opacity(0.5),
                        radius: 10)
            // overView
            CoinDetailsSEction(model: viewModel.OverViewSectionModel)
                .padding(.vertical)
            // additional Detail
            CoinDetailsSEction(model: viewModel.additionalDetailsSectionModel)
                .padding(.vertical)

        }
        .padding()
        .navigationTitle(viewModel.coinName)
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
