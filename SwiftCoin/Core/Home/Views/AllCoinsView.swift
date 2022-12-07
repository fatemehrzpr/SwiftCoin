//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/14/1401 AP.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .padding(.horizontal)
            .font(.headline)
            HStack{
                Text("Coins")
                Spacer()
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            ScrollView{
                VStack{
                    ForEach(viewModel.coins){ coin  in
                        NavigationLink {
                            LazyNavigationView(build: CoinDetailsView(coin: coin))
                            
                        } label: {
                            CoinRowView(coin: coin )
                        }

                        Divider()
                    }
                }
            }
           
        }
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
