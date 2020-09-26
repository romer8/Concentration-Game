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
        ScrollView{
//          Color.black.edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                VStack {
                    HStack{
                        Button("new game"){
                            withAnimation(.easeInOut(duration:0.75)){
                                emojiGame.startNewGame()
                            }
                        }
                        Spacer()
                        Spacer()
                        Text("Score: \(emojiGame.score)")                                .foregroundColor(.white)
                            .font(.system(size: 15))
                       
                    }
                    .padding()
                    .background(Color.black)
                    LazyVGrid(columns: columns(for:
                        geometry.size)){
                        ForEach(emojiGame.cards){ card in
                            CardView(card: card)
                                .onTapGesture{
                                    withAnimation(.linear(duration:2)){
                                        emojiGame.choose(card)
                                    }
                                }
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
