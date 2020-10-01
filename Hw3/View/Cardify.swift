//
//  Cardify.swift
//  Hw3
//
//  Created by IS543 on 9/24/20.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var colorHex: String
    var isFaceUp: Bool{
        rotation < 90
    }
    var animatableData: Double{
        get{ rotation}
        set{ rotation = newValue}
    }
    init(isFaceUp:Bool, colorHexCode: String){
        rotation = isFaceUp ? 0 : 180
        colorHex = colorHexCode
    }
    private let cardCornerRadius:CGFloat = 10.0
    func body(content: Content)-> some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius:cardCornerRadius)
                    .fill(Color.white)

                RoundedRectangle(cornerRadius:cardCornerRadius).stroke()


                content
            }.opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cardCornerRadius).fill(            Color(UIColor(hexString: colorHex)))
                .opacity(isFaceUp ? 0 :1 )

        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (x: 0, y: 1, z: 0)
        )
    }
}
extension View{
    func cardify(isFaceUp:Bool,colorHex: String) -> some View{
        modifier(Cardify(isFaceUp: isFaceUp,colorHexCode: colorHex))
    }
    
}
struct Cardify_Previews: PreviewProvider {
    static var previews: some View {
        Text("🍎").modifier(Cardify(isFaceUp: true, colorHexCode: "6909A1"))
            .padding()
    }
}
