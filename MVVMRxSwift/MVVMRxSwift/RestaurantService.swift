//
//  RestaurantService.swift
//  MVVMRxSwift
//
//  Created by Mohamed Kelany on 10/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}
class RestaurantService: RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { (observer) -> Disposable in
            guard let path = Bundle.main.path(forResource: "Restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {}
            }
            do {
              let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                
                observer.onNext(restaurants)
                
            } catch(let error) {
               observer.onError(error)
            }
            return Disposables.create {}
        }
    }
}
