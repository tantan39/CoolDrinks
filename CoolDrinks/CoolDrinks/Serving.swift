//
//  Serving.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/24/21.
//

import Foundation
import RealmSwift

struct Serving: Identifiable, Codable {
    
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
    
    var localModel: ServingRealmModel {
        ServingRealmModel(id: id, name: name, description: description, caffeine: caffeine, calories: calories)
    }
    
    internal init(id: UUID, name: String, description: String, caffeine: Int, calories: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.caffeine = caffeine
        self.calories = calories
    }
}

class ServingRealmModel: Object {
    @Persisted var id: UUID = .init()
    @Persisted var name: String = ""
    @Persisted var desc: String = ""
    @Persisted var caffeine: Int = 0
    @Persisted var calories: Int = 0
    
    override init() {
        
    }
    
    init(id: UUID, name: String, description: String, caffeine: Int, calories: Int) {
        
        self.id = id
        self.name = name
        self.desc = description
        self.caffeine = caffeine
        self.calories = calories
    }
}
