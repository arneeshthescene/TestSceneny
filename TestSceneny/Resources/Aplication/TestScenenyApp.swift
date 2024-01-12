//
//  TestScenenyApp.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import SwiftUI

@main
struct TestScenenyApp: App {
    @State private var coordinator: Coordinator = Coordinator()
    private var apiService: APIService = APIService(networkManager:  NetworkManager(),
                                                    configManager: ConfigManager(baseAPIURL: URL(string: "https://api.thedogapi.com")!))
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environment(\.coordinator, coordinator)
                .environment(\.apiService, apiService)
        }
    }
}
