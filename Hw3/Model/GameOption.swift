//
//  TypeGame.swift
//  Hw3
//
//  Created by IS543 on 9/25/20.
//

import Foundation

struct GameOption{
    var themesArray: GameOptionViewModel
    var concentrationGameName: String

    init (game: String ,themes:GameOptionViewModel){
        themesArray = themes
        concentrationGameName = game

    }
    
    
    


}
