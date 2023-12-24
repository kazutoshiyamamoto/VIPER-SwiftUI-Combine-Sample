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
    
    init(router: FirstViewRouter) {
        self.router = router
    }
    
    func presentDetail() {
        router.presentDetail()
    }
}
