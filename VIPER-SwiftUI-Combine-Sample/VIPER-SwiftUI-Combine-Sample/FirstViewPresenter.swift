//
//  FirstViewPresenter.swift
//  VIPER-SwiftUI-Combine-Sample
//
//  Created by home on 2023/12/23.
//

import Foundation
import Combine

class FirstViewPresenter {
    let router: FirstViewRouter
    
    var cartProductsSubject = PassthroughSubject<[String], Never>()
    
    var cartProducts = [String]() {
        didSet {
            cartProductsSubject
                .send(cartProducts)
        }
    }
    
    init(router: FirstViewRouter) {
        self.router = router
    }
    
    func viewDidLoad() {
        cartProducts = ["Product \(cartProducts.count)"]
    }
    
    func presentDetail() {
        router.presentDetail()
    }
}
