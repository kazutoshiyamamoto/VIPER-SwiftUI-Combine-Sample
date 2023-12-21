//
//  FirstView.swift
//  VIPER-SwiftUI-Combine-Sample
//
//  Created by home on 2023/12/21.
//

import SwiftUI

protocol FirstViewOutput: AnyObject {
    func firstViewDidTapAddProductButton()
    func firstViewDidTapOrderButton()
}

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

