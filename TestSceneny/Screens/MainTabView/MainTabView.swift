//
//  MainTabView.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import SwiftUI

struct MainTabView: View {
    @Environment(\.coordinator) private var coordinator
    
    @State private var selected: SelectedTab = .home
    @State private var selectedItem: String = "Home"
    
    var body: some View {

        TabView(selection: $selected) {
            coordinator.build(screen: .listView)
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(SelectedTab.home)
                .padding(1)
        }
        .navigationTitle(selectedItem)
        .onChange(of: selected) {  _ ,newValue in
            selectedItem = newValue.rawValue
        }.toolbar {
            Button("Upgrade") {
                coordinator.present(sheet: .upgrade)
            }
        }
    }
}

#Preview {
    MainTabView()
}
