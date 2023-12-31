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
    
    weak var delegate: FirstViewOutput?
    @ObservedObject var state: State
    
    init(delegate: FirstViewOutput, state: State) {
        self.delegate = delegate
        self.state = state
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Button(action: {
                    delegate?.firstViewDidTapAddProductButton()
                }, label: {
                    Text("商品を追加")
                })
                .padding(.top)
                
                List {
                    ForEach(0 ..< state.cartProducts.count, id: \.self) { index in
                        Text(state.cartProducts[index])
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()
                
                Button(action: {
                    delegate?.firstViewDidTapOrderButton()
                }, label: {
                    Text("注文する")
                })
                .padding(.bottom)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

