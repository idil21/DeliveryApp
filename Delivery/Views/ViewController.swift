//
//  ViewController.swift
//  Delivery
//
//  Created by Sıla Murat on 1.08.2023.
//


import UIKit
import SwiftUI
import ImageSlideshow

struct ImageSlideshowView: UIViewRepresentable {
    var images: [InputSource]
    
    func makeUIView(context: Context) -> ImageSlideshow {
        let slideshow = ImageSlideshow()
        slideshow.setImageInputs(images)
        slideshow.pageIndicatorPosition = PageIndicatorPosition(horizontal: .center, vertical: .customBottom(padding: 30))
        slideshow.contentScaleMode = UIViewContentMode.scaleToFill
        return slideshow
    }
    
    func updateUIView(_ uiView: ImageSlideshow, context: Context) {
        uiView.setImageInputs(images)
    }
}



