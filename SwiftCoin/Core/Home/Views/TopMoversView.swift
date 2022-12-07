//
//  TopMoversView.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/14/1401 AP.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 12) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink {
                            LazyNavigationView(build: CoinDetailsView(coin: coin))                            
                        } label: {
                            TopMoversItemsView(coin: coin)
                        }

                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
