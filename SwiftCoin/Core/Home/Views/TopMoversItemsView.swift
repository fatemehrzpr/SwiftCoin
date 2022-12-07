//
//  TopMoversItemsView.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/14/1401 AP.
//

import SwiftUI
import Kingfisher
struct TopMoversItemsView: View {
    let coin : Coin
    var body: some View {
        VStack(alignment: .leading){
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32,height: 32)
                .padding(.bottom,10 )
            HStack{
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primeryTexrColor)
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            Text(coin.priceChangePercentage24H!.toPercentString())
                .font(.headline)
                .foregroundColor(coin.priceChangePercentage24H! > 0 ? .green : .red )
        }
        .padding(10)

        .frame(width: 140,height: 140)
        .background(Color.theme.itemBackGroundColor)
//        .border(.gray, width: 1)
//        .cornerRadius(10)
        
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            )
        .padding(5)

    }
}
//
//struct TopMoversItemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemsView()
//    }
//}
