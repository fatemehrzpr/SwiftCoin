//
//  CoinDetailsSEction.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/24/1401 AP.
//

import SwiftUI

struct CoinDetailsSEction: View {
    let model: CoinDetailSectionModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack {
            Text(model.title)
                .font(.title.bold())
                .frame(maxWidth: .infinity,alignment: .leading)
            
            LazyVGrid(columns: columns,alignment: .leading,spacing: 20){
                ForEach(model.stats) { stat in
                    StatisticView(model: stat)
                }
            }
        }
        
    }
}

struct CoinDetailsSEction_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsSEction(model: dev.sectionModel)
    }
}
