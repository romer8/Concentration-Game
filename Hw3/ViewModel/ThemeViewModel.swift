//
//  ThemeViewModel.swift
//  Hw3
//
//  Created by IS543 on 9/26/20.
//

import Foundation

class ThemeViewModel: ObservableObject {
    @Published private var themeGame: Theme

    init(name: String, color: String, emojis: [String]){
        themeGame = Theme(name: name, color: color, emojis: emojis)
    }
    

    //create an array of generics for the emojisThings
    
    // MARK: - Access to Model
    
    func getTheme() -> Theme{
        return themeGame
    }
    func getEmojis()->[String]{
        return themeGame.contentArray
    }
    func getName()-> String{
        return themeGame.nameTheme
    }
    
    func getColor()-> String{
        return themeGame.colorTheme
    }
    // MARK: - Intents

    

}
