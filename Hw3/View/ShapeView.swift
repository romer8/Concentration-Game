//
//  ShapeView.swift
//  Hw3
//
//  Created by IS543 on 10/1/20.
//

import SwiftUI

struct ShapeView: View {
    var shapeRange: Int
    var colorShapeI: UIColor
    var fillShapeI: Bool
    var strokeShapeI: Bool
    var safeGuard: Int
    var body: some View {
        switch shapeRange {
            case 0...100:
                if(fillShapeI){
                    Triangle().fill(Color(colorShapeI)).scaledToFit()
                }
                else{
                    Triangle().stroke(Color(colorShapeI)).scaledToFit()
                }
            case 101...200:

                if(fillShapeI){
                    Circle(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false).fill(Color(colorShapeI)).scaledToFit()
                }
                else{
                    Circle(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false).stroke(Color(colorShapeI)).scaledToFit()
                }
            case 201...300:
                if(fillShapeI){
                    SpiroSquare(corners: 6, smoothness: 0.45).fill(Color(colorShapeI)).scaledToFit()
                }
                else{
                    SpiroSquare(corners: 6, smoothness: 0.45).stroke(Color(colorShapeI)).scaledToFit()
                }
            default:
                if(fillShapeI){
                    Square().fill(Color(colorShapeI)).scaledToFit()
                }
                else{
                    Square().stroke(Color(colorShapeI)).scaledToFit()                }
        }
        
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(shapeRange: 250, colorShapeI: .red, fillShapeI: false, strokeShapeI: false, safeGuard: 2500)

    }
}
