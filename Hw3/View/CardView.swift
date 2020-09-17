//
//  CardView.swift
//  Hw3
//
//  Created by IS543 on 9/16/20.
//

import SwiftUI

struct CardView: View{
    var card: ConcentrationGame<String>.Card

    var body : some View{
        GeometryReader{ geometry in
            ZStack{
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius:
                        cardCornerRadius).fill(Color
                        .white)
                    RoundedRectangle(cornerRadius:cardCornerRadius).stroke()
                    Text(card.content)
                        .font(systemFont(for:geometry.size))
                }
                else if card.isMatched{
                    Text("")
                }

                else{
                    RoundedRectangle(cornerRadius:cardCornerRadius).fill()
                }
            }
        }.aspectRatio(2.5/3,contentMode:.fit)
    }
    private func systemFont(for size: CGSize) -> Font {
        return Font.system(size:min(size.width,
            size.height)*fontScaleFactor)
    }
    private let cardCornerRadius:CGFloat = 10.0
    private let fontScaleFactor:CGFloat = 0.70
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card:
            ConcentrationGame<String>.Card(content:
            "🥝",id:1))
            .padding(50)
        
    }
}
