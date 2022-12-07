//
//  CoinRowView.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/14/1401 AP.
//

import SwiftUI
import Kingfisher
struct CoinRowView: View {
    
    let coin :Coin
    
    var body: some View {
        HStack{
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32,height: 32)
                .foregroundColor(.orange)
            VStack(alignment: .leading,spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(coin.symbol.uppercased() )
                    .font(.caption)
            }
            .foregroundColor(Color.theme.primeryTexrColor)
            .padding(.leading,6)
            Spacer()
            VStack(alignment: .trailing,spacing: 4){
                Text(coin.currentPrice.toCurrency())
                
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.primeryTexrColor)

                if let value = coin.priceChangePercentage24H {
                    Text("\(value.toPercentString())")
                        .font(.caption)
                        .foregroundColor(value > 0 ? .green : .red )
                }
                                
            }
            .padding(.trailing,6)
            
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
