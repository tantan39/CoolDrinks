//
//  Menu.swift.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/23/21.
//

import Foundation

class Menu: ObservableObject, Codable {
    var sections: [MenuSection] = []
    var milkOptions: [ConfigurationOptions] = [ConfigurationOptions.none]
    var syrupOptions: [ConfigurationOptions] = [ConfigurationOptions.none]
    
    init() {
        if let path = Bundle.main.url(forResource: "menu", withExtension: "json") {
            let data = try! Data(contentsOf: path)
            let menuData = try? JSONDecoder().decode(Menu.self, from: data)
            self.sections = menuData?.sections ?? []
            self.milkOptions.append(contentsOf: menuData?.milkOptions ?? [])
            self.syrupOptions.append(contentsOf: menuData?.syrupOptions ?? [])
        }
    }
}
