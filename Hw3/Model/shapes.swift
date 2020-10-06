//
//  shapes.swift
//  Hw3
//
//  Created by IS543 on 10/1/20.
//

import Foundation
import SwiftUI

//struct shapeColorsI{
//    var colorUIShape: Int
//    init(c:Int){
//        
//    }
//}

struct SpiroSquare: Shape {
    let corners: Int
        let smoothness: CGFloat

        func path(in rect: CGRect) -> Path {
            guard corners >= 2 else { return Path() }

            let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

            var currentAngle = -CGFloat.pi / 2

            let angleAdjustment = .pi * 2 / CGFloat(corners * 2)

            let innerX = center.x * smoothness
            let innerY = center.y * smoothness

            var path = Path()

            path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

            var bottomEdge: CGFloat = 0

            for corner in 0..<corners * 2  {
                let sinAngle = sin(currentAngle)
                let cosAngle = cos(currentAngle)
                let bottom: CGFloat

                if corner.isMultiple(of: 2) {
                    bottom = center.y * sinAngle

                    path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
                } else {

                    bottom = innerY * sinAngle

                    path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
                }

                if bottom > bottomEdge {
                    bottomEdge = bottom
                }

                currentAngle += angleAdjustment
            }

            let unusedSpace = (rect.height / 2 - bottomEdge) / 2

            let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
            return path.applying(transform)
        }
    
}
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.size.width * 0.75, y: rect.size.width * 0.25))
        path.addLine(to: CGPoint(x: rect.size.width * 0.75, y: rect.size.width * 0.75))
        path.addLine(to: CGPoint(x: rect.size.width * 0.25, y: rect.size.width * 0.75))
        path.addLine(to: CGPoint(x: rect.size.width * 0.25, y: rect.size.width * 0.25))
        path.closeSubpath()

        return path
    }
}

struct Circle: Shape {
    var startAngle: Angle = .degrees(0)
    var endAngle: Angle = .degrees(360)
    var clockwise: Bool = false

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}

