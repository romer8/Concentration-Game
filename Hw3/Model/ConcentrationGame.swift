//
//  ConcentrationGame.swift
//  Hw3
//
//  Created by IS543 on 9/9/20.
//

import Foundation
struct ConcentrationGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var numberOfPairs: Int = 0
    var gameName: String
    var score: Int = 0
    let addScore: Int = 2
    let substractScore:Int = 1
    var activateSound: Bool = true{
        didSet{
            print("disabled/enabled")
        }
        
    }
    var indexOfTheOneAndOnlyOneFaceUpCard: Int?{
        get{cards.indices.filter { cards[$0].isFaceUp}.only}
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init (name: String,numberOfPairsOfCards:Int, colorShapes:[String], fillStyle:[Bool], cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        score = 0
        gameName = name
        numberOfPairs = numberOfPairsOfCards
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content:content, colorCardforShape: colorShapes[pairIndex], fillShapeCard: fillStyle[pairIndex]))
            cards.append(Card(content:content, colorCardforShape: colorShapes[pairIndex], fillShapeCard: fillStyle[pairIndex]))
        }
        
        cards.shuffle()
    }
    mutating func deactivateActivateSound(isActive: Bool){
        activateSound = isActive
    }

    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(matching:card),
                !cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
            
            cards[chosenIndex].viewCount += 1
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score = score + addScore
                    numberOfPairs = numberOfPairs - 1
                    if(activateSound){playSound(match: true)}
                }
                else{
                    cards[chosenIndex].markMismatched()
                    cards[potentialMatchIndex].markMismatched()

                    if(activateSound){playSound(match: false)}

//                    if(score > 0 ){
//                        score = score - substractScore
//                    }
                }
                cards[chosenIndex].isFaceUp = true
            }
            else{
                stopSound()

                indexOfTheOneAndOnlyOneFaceUpCard = chosenIndex
            }
        }
            
    }    
    struct Card: Identifiable{
        private let matchScore = 5
        private let maxMatchBonus = 5.0
        
        fileprivate(set) var isFaceUp = false{
            didSet{
                if isFaceUp{
                    startUsingBonusTime()
                }else{
                    stopUsingBonusTime()
                }
            }
        }
        fileprivate(set) var isMatched = false{
            didSet{
                stopUsingBonusTime()
            }
        }
        fileprivate(set) var mismatchedCount = 0
        fileprivate(set) var viewCount = 0
        fileprivate(set) var content: CardContent
        var colorCardforShape: String = "fffff"
        var fillShapeCard: Bool = true
        var id = UUID()
        
        var score: Int{
            if isMatched{
                return matchScore + Int(bonusRemaining * maxMatchBonus)
            }else{
                return 0
            }
        }
        
        fileprivate mutating func markMismatched(){
            if viewCount > 1{
                mismatchedCount += 1
            }
        }
        // MARK: - Bonus Time
        
        var bonusTimeLimit: TimeInterval = 5
        var lastFaceUpTime: Date?
        var pastFaceUpTime: TimeInterval = 0
        
        var bonusTimeRemaining: Double {
            max(0,bonusTimeLimit - faceUpTime)
        }
        var bonusRemaining: Double{
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        var hasEarnedBonus: Bool{
            isMatched && bonusTimeRemaining > 0
        }
        var isConsumingBonusTime: Bool{
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private var faceUpTime: TimeInterval{
            if let lastFaceUpTime = lastFaceUpTime{
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpTime)
            }
            else{
                return pastFaceUpTime
            }
        }
        private mutating func startUsingBonusTime(){
            if isConsumingBonusTime && lastFaceUpTime == nil{
                lastFaceUpTime = Date()
            }
        }
        private mutating func stopUsingBonusTime(){
            pastFaceUpTime = faceUpTime
            lastFaceUpTime = nil
        }

        

    }
    
}
