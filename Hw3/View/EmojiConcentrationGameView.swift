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
        Array(repeating: GridItem(.flexible()), count: Int(size.width/desiredCardWidth))
    }
    var body:some View {
        
            GeometryReader { geometry in
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Text("Score")                                .foregroundColor(.white)
                            .font(.system(size: 15))
                        Spacer()
                        Text(emojiGame.score).foregroundColor(.white)
                            .font(.system(size: 30))
                        Spacer()
                        Button(action: {
                            emojiGame.startNewGame()
                        }) {
                            Text("New Game")
                                .padding()
                                .cornerRadius(70)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                                
                        }
                    }
                    .padding()
                    .background(Color.black)
                    LazyVGrid(columns: columns(for:
                        geometry.size)){
                        ForEach(emojiGame.cards){ card in
                            CardView(card: card)
                                .onTapGesture{
                                    emojiGame.choose(card)
                                }
                        }
                    }
                    .padding()
                    .foregroundColor(.blue)

                }
                

            }

    }
    private let desiredCardWidth: CGFloat = 100
}

struct EmojiConcentrationGameView_Previews:
    PreviewProvider{
    static var previews: some View{
        EmojiConcentrationGameView(emojiGame:EmojiConcentrationGame())
    }
}
