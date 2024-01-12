//
//  ProductViewModel.swift
//  TestSceneny
//
//  Created by Vladislav on 1/12/24.
//

import Foundation

@Observable
class ProductViewModel {
    private var apiService: APIService?
    var breedDetail: BreedDetail?
    var mainImageUrl: String = ""
    
    var errorMessage: String?
    var showingAlert = false
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func setup(_ apiService: APIService?) {
        self.apiService = apiService
    }
    
    func fetchBreed() async {
        do {
            if let breedDetailData = try await self.apiService?.fetchBreeds(id: id) {
                breedDetail = BreedDetail(from: breedDetailData)
                await fetchBreedImage(imageId: breedDetailData.referenceImageID)
            }
        } catch {
            self.errorMessage = error.localizedDescription
            self.showingAlert = true
            print("Unexpected error: \(error)")
        }
    }
    
    func fetchBreedImage(imageId: String) async {
        do {
            if let mainImageData = try await self.apiService?.fetchBreedsImages(imageId: imageId) {
                mainImageUrl = mainImageData.url
            }
        } catch {
            self.errorMessage = error.localizedDescription
            self.showingAlert = true
            print("Unexpected error: \(error)")
        }
    }
}
