//
//  CustomizeView.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/24/21.
//

import SwiftUI

struct CustomizeView: View {
    let drink: MenuDrink
    
    @State private var size = 0
    @State private var isDecaf = false
    
    let sizeOptions = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        100
    }
    
    var calories: Int {
        100
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
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            } header: {
                Text("Basic Options")
            }
        
            Section {
                Text("**Caffeine**: \(caffeine) mg")
                Text("**Calories**: \(calories)")
            } header: {
                Text("Estimate")
            }

        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: MenuDrink(id: UUID(), name: "menu name", caffeine: [80,100], coffeeBased: true, servedWithMilk: true, baseCalories: 80))
    }
}
