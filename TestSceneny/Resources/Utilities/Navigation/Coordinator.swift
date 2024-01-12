//
//  Coordinator.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

import Foundation
import SwiftUI

@Observable
class Coordinator {
    
    var path = NavigationPath()
    var sheet: Sheet?
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .tabsScreen:
            MainTabView()
        case .listView:
            ListView()
        case .productView(let id):
            ProductView(id: id)
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .upgrade:
            NavigationStack{
                UpgradeView()
            }
        }
    }
}
