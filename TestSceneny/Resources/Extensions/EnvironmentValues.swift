//
//  EnvironmentValues.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation
import SwiftUI

extension EnvironmentValues {
    var coordinator: Coordinator {
        get { self[CoordinatorKey.self] }
        set { self[CoordinatorKey.self] = newValue }
    }
    
    var apiService: APIService? {
        get { self[APIServiceKey.self] }
        set { self[APIServiceKey.self] = newValue }
    }
}
