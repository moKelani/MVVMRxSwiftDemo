//
//  Restaurant.swift
//  MVVMRxSwift
//
//  Created by Mohamed Kelany on 10/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
     case european
     case french
     case indian
     case mexican
     case english
     case american
}
