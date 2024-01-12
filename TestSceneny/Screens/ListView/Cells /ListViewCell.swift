//
//  ListViewCell.swift
//  TestSceneny
//
//  Created by Vladislav on 1/12/24.
//

import SwiftUI

struct ListViewCell: View {
    @State var breed: BreedsList
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: breed.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(breed.name)
                    .bold()
                    .font(.title3)
                if let bredFor = breed.bredFor {
                    Text(bredFor)
                }
            }
        }
    }
}

