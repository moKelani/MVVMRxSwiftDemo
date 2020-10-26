//
//  AppCoordinator.swift
//  MVVMRxSwift
//
//  Created by Mohamed Kelany on 10/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiate(viewModel: RestaurantListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

