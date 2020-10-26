//
//  RestaurantListViewModel.swift
//  MVVMRxSwift
//
//  Created by Mohamed Kelany on 10/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation
import RxSwift

final class RestaurantListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService() ) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map {$0.map { RestaurantViewModel(restaurant: $0) }}
    }
}
