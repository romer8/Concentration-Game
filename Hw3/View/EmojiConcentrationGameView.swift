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
                    if(emojiGame.getRemainingPairs() > 0){
                        LazyVGrid(columns: columns(for:
                            geometry.size)){
                            ForEach(emojiGame.cards){ card in
                                CardView(colorTheme: emojiGame.getColorTheme(), card: card )
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
                        Spacer()
                        Spacer()


                        HStack{
                            Button("new game"){
                                withAnimation(.easeInOut(duration:0.75)){
    //                                emojiGame.startNewGame()
                                }
                            }
                            Spacer()
                            Spacer()
                            Text("Score: \(emojiGame.score)")                                .foregroundColor(.white)
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
        print("my random size")
        print(randomSize)
        return randomSize
    }
}

struct EmojiConcentrationGameView_Previews:
    PreviewProvider{
    static var previews: some View{
        EmojiConcentrationGameView(emojiGame:EmojiConcentrationGame(name: "EmojiMojo", themevm: ThemeViewModel(name: "EmojiGeneral", color: "FFFF", emojis: ["r","f","x","s"]), numberCards: 2))
    }
}
