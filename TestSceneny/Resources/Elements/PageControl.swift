//
//  PageControl.swift
//  TestSceneny
//
//  Created by Vladislav on 1/12/24.
//

import SwiftUI

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        return pageControl
    }

    func updateUIView(_ pageControl: UIPageControl, context: Context) {
        pageControl.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var parent: PageControl

        init(_ pageControl: PageControl) {
            self.parent = pageControl
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
