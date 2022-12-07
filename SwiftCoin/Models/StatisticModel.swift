//
//  StatisticModel.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 8/24/1401 AP.
//

import Foundation

struct StatisticModel: Identifiable {
    let id =  UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
}

