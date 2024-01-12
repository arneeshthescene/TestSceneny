//
//  ProductView.swift
//  TestSceneny
//
//  Created by Vladislav on 1/12/24.
//

import SwiftUI

struct ProductView: View {
    enum Constant {
        static let frame = CGSize(width: 300, height: 200)
        static let cornerRadius = 10.0
    }
    
    @Environment(\.apiService) private var apiService
    @Environment(\.coordinator) private var coordinator
    
    @State private var viewModel: ProductViewModel
    
    init(id: Int) {
        viewModel = ProductViewModel(id: id)
    }
    
    var body: some View {
        ScrollView {
            if viewModel.breedDetail != nil {
                VStack(alignment: .center, spacing: 8) {
                    
                    AsyncImage(url: URL(string: viewModel.mainImageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: Constant.frame.width, height: Constant.frame.height)
                    .cornerRadius(Constant.cornerRadius)
                    
                    if let name = viewModel.breedDetail?.name {
                        Text(name)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    
                    if let breedGroup = viewModel.breedDetail?.breedGroup {
                        Label("Breed Group: \(breedGroup)", systemImage: "pawprint")
                    }
                    
                    if let bredFor = viewModel.breedDetail?.bredFor {
                        Label("Bred For: \(bredFor )", systemImage: "heart")
                    }
                    
                    if let lifeSpan = viewModel.breedDetail?.lifeSpan {
                        Label("Life Span: \(lifeSpan)", systemImage: "clock")
                    }
                    
                    if let origin = viewModel.breedDetail?.origin {
                        Label("Origin: \(origin)", systemImage: "map")
                    }
                }
                .padding()
            } else {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.breedDetail?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Error", isPresented: $viewModel.showingAlert) {
            Button("Try again") {
                Task {
                    await viewModel.fetchBreed()
                }
            }
            Button("Close", role: .cancel) {
                coordinator.popToRoot()
            }
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
        .onAppear{
            viewModel.setup(apiService)
            Task {
                await viewModel.fetchBreed()
            }
        }
    }
}

#Preview {
    ProductView(id: 1)
}
