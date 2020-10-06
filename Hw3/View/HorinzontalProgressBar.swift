//
//  HorinzontalProgressBar.swift
//  Hw3
//
//  Created by IS543 on 10/5/20.
//

import Foundation
import SwiftUI

struct HorizontalProgressBar: Shape {

    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false

    var animatableData: AnimatablePair<Double, Double>{
        get{
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set{
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }

    }
    
    func path (in rect: CGRect) -> Path{
        let center = CGPoint(x: rect.midX, y: rect.minY)
        let radius = min(rect.width, rect.height)/2

        var p = Path()
//        p.move(to:center)

        p.move(to: CGPoint(x: center.x + radius * cos(CGFloat(endAngle.radians)) * 0.9, y: rect.maxY))
        p.addLine(to: CGPoint(x: center.x + radius * cos(CGFloat(endAngle.radians)) * 0.9, y: rect.maxY * 0.98))
        p.addLine(to: CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)) * 0.9, y: rect.maxY * 0.98))
        p.addLine(to: CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)) * 0.9, y: rect.maxY))


        p.closeSubpath()

        return p
    }

}

struct HorizontalProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProgressBar(startAngle: Angle.degrees(0), endAngle: Angle.degrees(-180),clockwise: true).foregroundColor(.orange).opacity(0.4)
        
    }
}
