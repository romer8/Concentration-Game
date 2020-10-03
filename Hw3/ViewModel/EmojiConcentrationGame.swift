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
    @Published var themeVM: ThemeViewModel
    @Published private var game: ConcentrationGame<String>
    @Published private var isVisible = false
    var colorsArraysI:[String] = []
    var styleShapesArrayI:[Bool]=[]

    
    
//    @Published private var game = createGame()
    
//    private static let emojis = ["🍏","🍎","🍊","🍋","🍈","🥦"]
    
//    static func createGame()-> ConcentrationGame<String> {
//        ConcentrationGame<String>(numberOfPairsOfCards: emojis.count){index in emojis[index]}
//    }
    static func createGame(name: String, emojis: [String], colorsShapes:[String], fillOrNot:[Bool])-> ConcentrationGame<String> {
        ConcentrationGame<String>(name: name, numberOfPairsOfCards: emojis.count, colorShapes: colorsShapes, fillStyle: fillOrNot){index in emojis[index]}
    }
    
    init(name: String, themevm: ThemeViewModel, numberCards:Int){
        nameGame = name
        numberOfCards = numberCards
        themeVM = themevm
        var emojis: [String] = []
        for index in 0...numberOfCards{
            emojis.append(themevm.getEmojis()[index])
            colorsArraysI.append(themevm.getCS()[index])
            if(index <= numberOfCards/2){
                styleShapesArrayI.append(true)
            }
            else{
                styleShapesArrayI.append(false)
            }
        }

        styleShapesArrayI = styleShapesArrayI.shuffled()
        game = EmojiConcentrationGame.createGame(name: name, emojis: emojis, colorsShapes: colorsArraysI, fillOrNot: styleShapesArrayI)
    }
    // MARK: - Access to Model
    var cards: Array<ConcentrationGame<String>.Card> {
        if isVisible {
            return game.cards
        }
        else{
            return []
        }
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
    func getRemainingPairs() -> Int{
        return game.numberOfPairs
    }
    func getColorTheme() -> String {
        return themeVM.getColor()
    }
    func getTotalCards() -> Int{
        return numberOfCards
    }
    func getTotalPairs() -> Int{
        return numberOfCards
    }
    // MARK: - Intents
    func choose(_ card:ConcentrationGame<String>.Card) {
        game.choose(card)
    }
    func startNewGame(){
        var emojis: [String] = []
        var colorsTemp: [String] = []
        var fillTemp:[Bool] = []
        for index in 0...numberOfCards{
            emojis.append(themeVM.getEmojis()[index])
            colorsTemp.append(themeVM.getCS()[index])
            if(index <= numberOfCards/2){
                fillTemp.append(true)
            }
            else{
                fillTemp.append(false)
            }
        }
        game = EmojiConcentrationGame.createGame(name: game.gameName, emojis: emojis, colorsShapes: colorsTemp,fillOrNot: fillTemp)
        isVisible = false
    }
    
    func dealCards(){
        isVisible = true
    }
    

}

