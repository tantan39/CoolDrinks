//
//  MenuView.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/23/21.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { section in
                        Section {
                            ForEach(section.matches(for: searchText)) { item in
                                NavigationLink {
                                    CustomizeView(drink: item) {
                                        dismiss()
                                    }
                                    .environmentObject(menu)
                                } label: {
                                    VStack {
                                        Image(item.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        Text(item.name)
                                            .font(.system(.body, design: .serif))
                                        
                                    }
                                    .padding(.bottom)
                                }
                                .buttonStyle(.plain)
                            }
                        } header: {
                            Text(section.name)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(Color.white)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Add Drinks")
            .searchable(text: $searchText)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuView()
                .environmentObject(Menu())
        }
    }
}
