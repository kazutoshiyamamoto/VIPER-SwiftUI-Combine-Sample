//
//  ViewController.swift
//  VIPER-SwiftUI-Combine-Sample
//
//  Created by home on 2023/12/20.
//

import UIKit
import SwiftUI
import Combine

class FirstViewController: UIViewController {
    var presenter: FirstViewPresenter!
    
    private let firstViewState = FirstView.State(cartProducts: [])
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = FirstView(delegate: self, state: firstViewState)
        let hostingVC = UIHostingController(rootView: rootView)
        addChild(hostingVC)
        hostingVC.didMove(toParent: self)
        view.addSubview(hostingVC.view)
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        presenter.cartProductsSubject
            .sink { [weak self] value in
                self?.firstViewState.cartProducts = value
            }
            .store(in: &cancellables)
        
        presenter.viewDidLoad()
    }
}

extension FirstViewController: FirstViewOutput {
    func firstViewDidTapAddProductButton() {
        presenter.addProduct()
    }
    
    func firstViewDidTapOrderButton() {
        presenter.presentDetail()
    }
}

