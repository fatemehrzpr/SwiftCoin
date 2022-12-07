//
//  LazyNavigationView.swift
//  SwiftCoin
//
//  Created by Fatemeh Razipour on 9/15/1401 AP.
//

import Foundation
import SwiftUI

struct LazyNavigationView<Content: View> : View {
    let build: () -> Content
    
    init(build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
