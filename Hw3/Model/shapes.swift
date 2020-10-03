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
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rotations = 100
        let amount = .pi / CGFloat(rotations)
        let transform = CGAffineTransform(rotationAngle: amount)

        for _ in 0 ..< rotations {
            path = path.applying(transform)

            path.addRect(CGRect(x: -rect.width / 2, y: -rect.height / 2, width: rect.width, height: rect.height))
        }

        return path
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



struct shapes_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
