//
//  ViewController.swift
//  VIPER-SwiftUI-Combine-Sample
//
//  Created by home on 2023/12/20.
//

import UIKit
import SwiftUI

class FirstViewController: UIViewController {

    private let firstViewState = FirstView.State(cartProducts: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = FirstView(delegate: self, state: firstViewState)
        let hostingVC = UIHostingController(rootView: rootView)
        addChild(hostingVC)
        hostingVC.didMove(toParent: self)
        view.addSubview(hostingVC.view)
    }


}

