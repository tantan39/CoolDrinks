//
//  ConfigurationOptions.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/24/21.
//

import Foundation

struct ConfigurationOptions: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigurationOptions(id: UUID(), name: "None", calories: 0)
}
