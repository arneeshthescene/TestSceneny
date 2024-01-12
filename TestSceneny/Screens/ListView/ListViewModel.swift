//
//  ListViewModel.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

@Observable
class ListViewModel {
    private var apiService: APIService?
    
    private var itemsLoadedCount: Int?
    private var page = 0
    
    private let itemsFromEndThreshold = 6
    
    var breedsList: [BreedsList]? = []
    var dataIsLoading = false
    
    var errorMessage: String?
    var showingAlert = false
    
    func setup(_ apiService: APIService?) {
        self.apiService = apiService
    }
    
    func requestInitialBreedsList() async {
        page = 0
        requestItems(page: page)
    }
    
    func requestMoreBreedsIfNeeded(index: Int) {
        guard let itemsLoadedCount = itemsLoadedCount else { return }
        
        if thresholdMeet(itemsLoadedCount, index) {
            page += 1
            requestItems(page: page)
        }
    }   
    
    private func requestItems(page: Int) {
        dataIsLoading = true
        Task { @MainActor in
            do {
                let response = try await self.apiService?.fetchBreedsList(page: page).map { BreedsList(from: $0) }
                self.breedsList?.append(contentsOf: response ?? [])
                self.itemsLoadedCount = self.breedsList?.count
                self.dataIsLoading = false
            } catch {
                self.errorMessage = "\(error)"  // Вы можете обработать ошибку более детально, если хотите.
                self.showingAlert = true
                self.dataIsLoading = false
            }
        }
    }
    
    private func thresholdMeet(_ itemsLoadedCount: Int, _ index: Int) -> Bool {
        return (itemsLoadedCount - index) == itemsFromEndThreshold
    }
}
