//
//  Sheet.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

enum Sheet: String, Identifiable {
    case upgrade
    
    var id: String {
        self.rawValue
    }
}
