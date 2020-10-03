//
//  EmojiConcentrationGame.swift
//  Hw3
//
//  Created by IS543 on 9/9/20.
//

import SwiftUI

struct EmojiConcentrationGameView: View{
    
    @ObservedObject var emojiGame: EmojiConcentrationGame
    
    private func columns(for size: CGSize)->[GridItem]
    {
        return Array(repeating: GridItem(.flexible()), count: Int(size.width/scaleFactor()))
    }
    private func scaleFactor() -> CGFloat {
        let difference: CGFloat = 10
        let pairs = Int(emojiGame.numberOfCards) + 1
        print(pairs)
//        print(emojiGame.getTotalPairs())
        switch pairs {
            case 1...4:
                return desiredCardWidth
            case 5...8:
                return desiredCardWidth - difference * 2
            case 9...12:
                return desiredCardWidth - difference * 3

            case 13...16:
                return desiredCardWidth - difference * 4

            case 17...20:
                return desiredCardWidth - difference * 5

            case 21...48:
                return desiredCardWidth - difference * 6
                
            case 49...100:
                return desiredCardWidth - difference * 7
                            
        default:
            return desiredCardWidth - difference * 8
        }
    }
    
    var body:some View {
        ScrollView{
//          Color.black.edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                VStack {
                    if(emojiGame.getRemainingPairs() > 0){
                        LazyVGrid(columns: columns(for:
                            geometry.size)){
                            ForEach(emojiGame.cards){ card in
                                let index = emojiGame.cards.firstIndex(matching: card)
                                CardView(cardGameType: emojiGame.nameGame, colorTheme: emojiGame.getColorTheme(), card: card, colorShapeI: UIColor(hexString: card.colorCardforShape),fillShapeI: card.fillShapeCard)
                                    .onTapGesture{
                                        withAnimation(.linear(duration:0.5)){
                                            emojiGame.choose(card)

                                        }
                                    }
                                    .transition(AnyTransition.offset(
                                        randomLocationOffScreen(for: geometry.size)
                                    ))
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.async {
                                withAnimation(Animation.easeInOut) {
                                     emojiGame.dealCards()
                                }
                            }

                        }

                        HStack{
                            Button("new game"){
                                withAnimation(.easeInOut(duration:0.75)){
    //                                emojiGame.startNewGame()
                                }
                            }
                            Spacer()
                            Spacer()
                            Text("Score: \(emojiGame.score)")
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                        }
                        .padding()
                        .background(Color.black)
                    }
                    else{
                    Text("You have completed the Game")
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30))
                        .padding()
                        .animation(.easeInOut(duration: 5))
//                        HStack{
                            Button("new game"){
                                withAnimation(.easeInOut(duration:0.75)){
                                    emojiGame.startNewGame()
                                }
                            }

                            Text("Your Score is : \(emojiGame.score)")
                                .font(.system(size: 20))
                                .padding()
//                        }

                        
                    }
                }
                .foregroundColor(.blue)
                    
            }
        }
    }
    private let desiredCardWidth: CGFloat = 100
    
    func randomLocationOffScreen(for size: CGSize) -> CGSize {
        var randomSize = CGSize.zero
        let randomAngle = Double.random(in: 0..<Double.pi * 2)
        let scaleFactor = max(size.width, size.height) * 1.5

        randomSize.width = CGFloat(sin(randomAngle)) * scaleFactor
        randomSize.height = CGFloat(cos(randomAngle)) * scaleFactor
        return randomSize
    }
}

struct EmojiConcentrationGameView_Previews:
    PreviewProvider{
    static var previews: some View{
        EmojiConcentrationGameView(emojiGame:EmojiConcentrationGame(name: "EmojiMojo", themevm: ThemeViewModel(name: "EmojiGeneral", color: "FFFF", emojis: ["r","f","x","s"]), numberCards: 2))
    }
}
