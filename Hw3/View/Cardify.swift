//
//  Cardify.swift
//  Hw3
//
//  Created by IS543 on 9/24/20.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var isFaceUp: Bool{
        rotation < 90
    }
    var animatableData: Double{
        get{ rotation}
        set{ rotation = newValue}
    }
    init(isFaceUp:Bool){
        rotation = isFaceUp ? 0 : 180
    }
    private let cardCornerRadius:CGFloat = 10.0
    func body(content: Content)-> some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius:cardCornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius:cardCornerRadius).stroke()
                content
            }.opacity(isFaceUp ? 1 : 0)

            RoundedRectangle(cornerRadius: cardCornerRadius).fill()
                .opacity(isFaceUp ? 0 :1 )
        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (x: 0, y: 1, z: 0)
        )
    }
}
extension View{
    func cardify(isFaceUp:Bool) -> some View{
        modifier(Cardify(isFaceUp: isFaceUp))
    }
    
}
struct Cardify_Previews: PreviewProvider {
    static var previews: some View {
        Text("🍎").modifier(Cardify(isFaceUp: true))
            .padding()
    }
}
