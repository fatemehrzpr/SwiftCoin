//
//   ChartData.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 9/14/1401 AP.
//

import Foundation

struct ChartData: Identifiable{
    let id = UUID().uuidString
    let date: Date 
    let value: Double
    
}
