//
//  UpgradeView.swift
//  TestSceneny
//
//  Created by Vladislav on 1/11/24.
//

import SwiftUI

struct UpgradeView: View {
    enum Constant {
        static let frame = CGSize(width: 300, height: 300)
        static let cornerRadius = 25.0
        static let safeAreaPadding = 40.0
        static let defaultPadding = 10.0
        static let horizontalButtonPadding = 30.0
        static let closeButtonPadding = 10.0
    }
    
    @Environment(\.coordinator) private var coordinator
    
    @State var plans: [String] = ["Plan one","Part two", "Part three"]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.white
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        coordinator.dismissSheet()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.title)
                            .padding(20)
                    }
                    .padding(.trailing, Constant.closeButtonPadding)
                    .padding(.top, Constant.closeButtonPadding)
                }
                VStack {
                    Text("Lorem ipsum dolor sit amet")
                        .bold()
                        .font(.title)
                        .padding(.vertical,5)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor")
                    
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(plans, id: \.self) { plan in
                            rectangleView(text: plan)
                                .scrollTransition { effect, phase in
                                    effect.scaleEffect(phase.isIdentity ? 1: 0.8)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }

                .safeAreaPadding(.horizontal, Constant.safeAreaPadding)
                
                PageControl(numberOfPages: plans.count, currentPage: $currentPage)
                
                VStack {
                    Text("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore")
                        .padding(.top,10)
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Text("Get Plan")
                            .fontWeight(.semibold)
                            .padding(.vertical, Constant.defaultPadding)
                            .padding(.horizontal, Constant.defaultPadding)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .background(.orange)
                    .clipShape(Capsule())
                    .padding(.horizontal, Constant.horizontalButtonPadding)
                    .padding(.bottom,Constant.defaultPadding)
                }
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(Constant.cornerRadius)
                .padding(20)
            }
        }
    }
    
    private func rectangleView(text: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constant.cornerRadius)
                .fill(.orange)
            VStack{
                Spacer()
                Text(text)
                    .bold()
                
                Spacer()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                Spacer()
                Text("$5.99")
                    .bold()
                    .font(.title)
                Spacer()
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("Get Plan")
                        .fontWeight(.semibold)
                        .padding(.vertical, Constant.defaultPadding)
                        .padding(.horizontal, Constant.defaultPadding)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .background(.green)
                .clipShape(Capsule())
                .padding(.horizontal, Constant.horizontalButtonPadding)
                Spacer()
            }
        }
        .frame(width: Constant.frame.width,
               height: Constant.frame.height)
    }
}

#Preview {
    UpgradeView()
}

