//
//  FirstView.swift
//  VIPER-SwiftUI-Combine-Sample
//
//  Created by home on 2023/12/21.
//

import SwiftUI

struct FirstView: View {
    class State: ObservableObject {
        @Published var cartProducts: [String]
        
        init(cartProducts: [String]) {
            self.cartProducts = cartProducts
        }
    }
    var body: some View {
    }
}

