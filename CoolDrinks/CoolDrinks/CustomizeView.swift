//
//  CustomizeView.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/24/21.
//

import SwiftUI

struct CustomizeView: View {
    let drink: MenuDrink
    @EnvironmentObject var menu: Menu
    
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk: ConfigurationOptions?
    @State private var syrup: ConfigurationOptions?
    
    let sizeOptions = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += (extraShots * 60)
        if isDecaf {
            caffeineAmount /= 20
        }
        return caffeineAmount
    }
    
    var calories: Int {
        var caloriesAmount = drink.baseCalories
        caloriesAmount += (extraShots * 10)
        
        if drink.coffeeBased {
            caloriesAmount += milk?.calories ?? 0
        } else {
            caloriesAmount += milk?.calories ?? 0 / 8
        }
        caloriesAmount += syrup?.calories ?? 0
        
        return caloriesAmount * (size + 1)
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Size", selection: $size) {
                    ForEach(sizeOptions.indices) { idx in
                        Text(sizeOptions[idx])
                    }
                }
                .pickerStyle(.segmented)
                
                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)", value: $extraShots, in: 0...8)
                }
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            } header: {
                Text("Basic Options")
            }
            
            Section {
                Picker("Milks", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
                    }
                }
                
                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            } header: {
                Text("Customizations")
            }
            
            Section {
                Text("**Caffeine**: \(caffeine) mg")
                Text("**Calories**: \(calories)")
            } header: {
                Text("Estimate")
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: MenuDrink(id: UUID(), name: "menu name", caffeine: [80,100], coffeeBased: true, servedWithMilk: true, baseCalories: 80))
            .environmentObject(Menu())
    }
}
