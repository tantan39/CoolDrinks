//
//  Serving.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/24/21.
//

import Foundation

struct Serving: Identifiable, Codable {
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
