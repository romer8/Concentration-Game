//
//  CardView.swift
//  Hw3
//
//  Created by IS543 on 9/16/20.
//

import SwiftUI

struct CardView: View{
    var cardGameType: String = "Temple Match"
    var colorTheme: String = "FFFFFF"
    var card: ConcentrationGame<String>.Card
    @State private var animatedBonusRemaining = 0.0
    @State var checkGuard: Int = 0
    var colorShapeI: UIColor = .black
    var fillShapeI: Bool = true
    
    var strokeShapeI: Bool = false
    @State var attempts: Int = 0

    
     static func ci (s: String) ->Int{
        return Int(s) ?? 0

    }
    var body : some View{
        GeometryReader{ geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack{
                    Group{
                        if card.isConsumingBonusTime{
                            if cardGameType == "EmojiMojo"{
                                Pie(startAngle: angle(for: 0),
                                    endAngle: angle(for: -animatedBonusRemaining),
                                    clockwise: true)
                                    .onAppear(){
                                        startBonusTimeAnimation()
                                    }
                            }
                            else if cardGameType == "Temple Match"{
                                HorizontalProgressBar(startAngle: angle2(for: 0),
                                                      endAngle: angle2(for: animatedBonusRemaining)
                                                      ,clockwise: false).onAppear(){
                                                        startBonusTimeAnimation()
                                                    }
                            }
                            
                            
                        }
                        else{
                            if cardGameType == "EmojiMojo" {
                                Pie(startAngle: angle(for: 0), endAngle: angle(for: -card.bonusRemaining),clockwise: true)

                            }
                            else if cardGameType == "Temple Match"{
                                HorizontalProgressBar(startAngle: angle2(for: 0),
                                                      endAngle: angle2(for: animatedBonusRemaining)
                                                      ,clockwise: false)
                            }
                        }
                        
                    }
                    .opacity(0.4)
                    .padding()
                    .transition(/*@START_MENU_TOKEN@*/.identity/*@END_MENU_TOKEN@*/)
                    
                    if(cardGameType == "EmojiMojo"){
                        Text(card.content)
                            .font(systemFont(for:geometry.size))
                            .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                            .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false): .default)
                    }
 
                    else if (cardGameType == "Temple Match") {
                        imageTempleView(fileNameString: card.content)
                            .opacity(card.isMatched ? 0 : 1)
                            .animation(card.isMatched ? Animation.linear(duration: 0.1).repeatForever(autoreverses: false): .default)


                    }
                    else if(cardGameType == "Shape Match"){
                        ShapeView(shapeRange: CardView.ci(s:card.content), colorShapeI: colorShapeI, fillShapeI: fillShapeI, strokeShapeI: strokeShapeI,safeGuard: 1)
                            .offset(x: card.isMatched ? -1.5 : 0, y: card.isMatched ? 1: 0).animation(card.isMatched ? Animation.linear(duration: 0.1).repeatForever(autoreverses: false): .default)

                       
                    }

                }
                .cardify(isFaceUp: card.isFaceUp, colorHex: colorTheme)
                .transition(.scale)
            }

        }.aspectRatio(cardAspectRatio,contentMode:.fit)
    }
    private func angle(for degrees: Double) -> Angle{
        Angle.degrees(degrees * 360 - 90)
    }
    private func startBonusTimeAnimation(){
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)){
            animatedBonusRemaining = 0
        }
    }
    private func angle2(for degrees: Double) -> Angle{
        Angle.degrees(180 - degrees * 180)
    }

    
    private func systemFont(for size: CGSize) -> Font {
        return Font.system(size:min(size.width,
            size.height)*fontScaleFactor)
    }
    
    private let cardAspectRatio: CGFloat = 2/3
    private let fontScaleFactor:CGFloat = 0.70
    
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card:
                    ConcentrationGame<String>.Card(isFaceUp:true, content:"🥝", colorCardforShape: "fffff",fillShapeCard: true))
            .padding(50)
        
    }
}
