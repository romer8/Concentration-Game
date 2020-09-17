//
//  ConcentrationGame.swift
//  Hw3
//
//  Created by IS543 on 9/9/20.
//

import Foundation

struct ConcentrationGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var score: Int = 0
    let addScore: Int = 2
    let substractScore:Int = 1
    var indexOfTheOneAndOnlyOneFaceUpCard: Int?{
        get{cards.indices.filter { cards[$0].isFaceUp}.only}
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init (numberOfPairsOfCards:Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        score = 0
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content:content, id:pairIndex * 2 ))
            cards.append(Card(content:content, id: pairIndex * 2 + 3))
        }
        
        cards.shuffle()
    }
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(matching:card),
                !cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score = score + addScore
                }
                else{
                    if(score > 0 ){
                        score = score - substractScore
                    }
                }
                cards[chosenIndex].isFaceUp = true
            }
            else{

                indexOfTheOneAndOnlyOneFaceUpCard = chosenIndex
            }
        }
            
    }    
    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
    
}
