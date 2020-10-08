//
//  CGImage+Shape.swift
//  Hw3
//
//  Created by IS543 on 10/7/20.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

extension CGImage {

    static func generateStripePattern(
        colors: (UIColor, UIColor) = (.clear, .black),
        width: CGFloat = 6,
        ratio: CGFloat = 1) -> CGImage? {

    let context = CIContext()
    let stripes = CIFilter.stripesGenerator()
    stripes.color0 = CIColor(color: colors.0)
    stripes.color1 = CIColor(color: colors.1)
    stripes.width = Float(width)
    stripes.center = CGPoint(x: 1-width*ratio, y: 0)
    let size = CGSize(width: width, height: 1)

    guard
        let stripesImage = stripes.outputImage,
        let image = context.createCGImage(stripesImage, from: CGRect(origin: .zero, size: size))
    else { return nil }
    return image
  }
}

extension Shape {

    func stripes(angle: Double = 45, colorStripe: UIColor) -> AnyView {
        guard
            let stripePattern = CGImage.generateStripePattern(colors: (.black, colorStripe))
        else { return AnyView(self)}

        return AnyView(Rectangle().fill(ImagePaint(
            image: Image(decorative: stripePattern, scale: 1.0)))
        .scaleEffect(2)
        .rotationEffect(.degrees(angle))
        .clipShape(self))
    }
}
