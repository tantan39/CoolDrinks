//
//  ContentView.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/23/21.
//

import SwiftUI

struct ContentView: View {
    var menu = Menu()
    @StateObject var history = History()
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                if history.servings.isEmpty {
                    Button("Add your first drink") {
                        showingAddScreen = true
                    }
                } else {
                    ForEach(history.servings) { serving in
                        HStack {
                            VStack(alignment: .leading, content: {
                                Text(serving.name)
                                Text(serving.description)
                            })
                            
                            Spacer()
                            
                            Text("\(serving.caffeine) mg")
                            Text("\(serving.calories)")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: MenuView.init)
            .navigationTitle("CoolDrinks")
            .toolbar {
                Button {
                    showingAddScreen = true
                } label: {
                    Label("Add New Drink", systemImage: "plus")
                }
            }
        }
        .environmentObject(menu)
        .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
