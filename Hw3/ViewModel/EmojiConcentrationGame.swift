//
//  EmojiConcentrationGame.swift
//  Hw3
//
//  Created by IS543 on 9/16/20.
//

import Foundation
class EmojiConcentrationGame: ObservableObject{
    @Published private var game = createGame()
    
    private static let emojis = ["🍏","🍎","🍊","🍋","🍈","🥦"]
    
    static func createGame()-> ConcentrationGame<String> {
        ConcentrationGame<String>( numberOfPairsOfCards: emojis.count){index in emojis[index]
        }
    }
    // MARK: - Access to Model
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
//    var score: String{
//        String(game.score)
//    }
    var score: Int{
        var totalScore = 0
        for card in cards{
            if card.isMatched{
                totalScore += 1
                
            }
            totalScore -= card.mismatchedCount
        }
        
        return totalScore
    }

    // MARK: - Intents
    func choose(_ card:ConcentrationGame<String>.Card) {
        game.choose(card)
    }
    func startNewGame(){
        game = EmojiConcentrationGame.createGame()
    }
    

}

