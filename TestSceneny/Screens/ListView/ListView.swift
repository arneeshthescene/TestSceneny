//
//  ListView.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import SwiftUI

struct ListView: View {
    @Environment(\.apiService) private var apiService
    @Environment(\.coordinator) private var coordinator
    
    @State private var viewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        List {
            if let breedsList = viewModel.breedsList?.enumerated().map({ $0 }) {
                ForEach(breedsList, id: \.offset) { index, breed in
                    ListViewCell(breed: breed)
                        .onAppear {
                            viewModel.requestMoreBreedsIfNeeded(index: index)
                        }
                        .onTapGesture {
                            coordinator.push(.productView(id: breed.id))
                        }
                }
            }
            if viewModel.dataIsLoading {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        }
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .alert("Error", isPresented: $viewModel.showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
        .onAppear {
            viewModel.setup(apiService)
            Task {
                await viewModel.requestInitialBreedsList()
            }
        }
    }
}

#Preview {
    MainTabView()
        .environment(Coordinator())
}
