//
//  History.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/24/21.
//

import Foundation
import RealmSwift

class History: ObservableObject {
    @Published var servings: [Serving]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedDrinks")
    var localRealm: Realm
    
    init() {
        localRealm = try! Realm()
        let localModels = localRealm.objects(ServingRealmModel.self)
        servings = localModels.map { Serving(id: $0.id, name: $0.name, description: $0.desc, caffeine: $0.caffeine, calories: $0.calories )}

    }
    
    func save() {
        _ = servings.map { serving in
            try! localRealm.write {
                localRealm.add(serving.localModel)
            }
        }
    }
    
    func add(_ drink: MenuDrink, size: String, extraShots: Int, isDecaf: Bool, milk: ConfigurationOptions, syrup: ConfigurationOptions, caffeine: Int, calories: Int) {
        var description = [String]()
        description.append(size)
        
        if isDecaf {
            description.append("decaffeinated")
        }
        
        switch extraShots {
        case 0:
            break
        case 1:
            description.append("1 extra shot")
        default:
            description.append("\(extraShots) extra shot")
        }
        
        if milk != .none {
            description.append("\(milk.name.lowercased()) milk")
        }
        
        if syrup != .none {
            description.append("\(syrup.name.lowercased()) syrup")
        }
        
        let descriptionString = description.joined(separator: ", ")
        let serving = Serving(id: UUID(), name: drink.name, description: descriptionString, caffeine: caffeine, calories: calories)
        servings.insert(serving, at: 0)
        try! localRealm.write {
            localRealm.add(serving.localModel)
        }
    }
    
    func reorder(_ serving: Serving) {
        var copy = serving
        copy.id = UUID()
        servings.insert(copy, at: 0)
        try! localRealm.write {
            localRealm.add(serving.localModel)
        }
    }
    
    func delete(_ serving: Serving) {
        if let index = servings.firstIndex(where: { $0.id == serving.id }) {
            servings.remove(at: index)
            try! localRealm.write {
                localRealm.delete(serving.localModel)
            }
        }
    }
}
