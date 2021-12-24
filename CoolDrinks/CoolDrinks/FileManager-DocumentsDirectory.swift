//
//  FileManager-DocumentsDirectory.swift
//  CoolDrinks
//
//  Created by Tan Tan on 12/24/21.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
