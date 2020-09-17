//
//  EmojiConcentrationGame.swift
//  Hw3
//
//  Created by IS543 on 9/16/20.
//

import Foundation
class EmojiConcentrationGame: ObservableObject{
    @Published private var game = createGame()
    static let emojis = ["🍏","🍎","🍊","🍋","🍈","🥦"]
    static func createGame()-> ConcentrationGame<String> {
        ConcentrationGame<String>( numberOfPairsOfCards: emojis.count){index in emojis[index]
        }
    }
    // MARK: - Access to Model
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    var score: String{
        String(game.score)
    }

    // MARK: - Intents
    func choose(_ card:ConcentrationGame<String>.Card) {
        game.choose(card)
    }
    func startNewGame(){
        game = EmojiConcentrationGame.createGame()
    }
    

}

