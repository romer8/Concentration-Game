//
//  EmojiConcentrationGame.swift
//  Hw3
//
//  Created by IS543 on 9/16/20.
//

import Foundation
class EmojiConcentrationGame: ObservableObject{
    var nameGame: String
    var numberOfCards: Int
    var themeVM: ThemeViewModel
    @Published private var game: ConcentrationGame<String>
    
    
//    @Published private var game = createGame()
    
//    private static let emojis = ["🍏","🍎","🍊","🍋","🍈","🥦"]
    
//    static func createGame()-> ConcentrationGame<String> {
//        ConcentrationGame<String>(numberOfPairsOfCards: emojis.count){index in emojis[index]}
//    }
    static func createGame(name: String, emojis: [String])-> ConcentrationGame<String> {
        ConcentrationGame<String>(name: name, numberOfPairsOfCards: emojis.count){index in emojis[index]}
    }
    
    init(name: String, themevm: ThemeViewModel, numberCards:Int){
        nameGame = name
        numberOfCards = numberCards
        themeVM = themevm
        var emojis: [String] = []
        for index in 0...numberOfCards{
            emojis.append(themevm.getEmojis()[index])
        }

        game = EmojiConcentrationGame.createGame(name: name, emojis: emojis)
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
    func startNewGame(name: String, emojis: [String]){
        game = EmojiConcentrationGame.createGame(name: name, emojis: emojis)
    }
    

}

