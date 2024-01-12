//
//  CoordinatorView.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import SwiftUI

struct CoordinatorView: View {
    @Environment(\.coordinator) private var coordinator
    
    var body: some View {
        @Bindable var coordinator = coordinator
        
        NavigationStack(path: $coordinator.path) {
            coordinator.build(screen: .tabsScreen)
                .navigationDestination(for: Screen.self) { screen in
                    coordinator.build(screen: screen)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
    }
}

#Preview {
    CoordinatorView()
}

