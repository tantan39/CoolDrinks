//
//  Menu.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/23/21.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [MenuDrink]
}

struct MenuDrink: Identifiable, Codable {
    let id: UUID
    let name: String
    let caffeine: [Int]
    let coffeeBased: Bool
    
    var image: String {
         name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
}
