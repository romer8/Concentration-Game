//
//  GameOptionViewModel.swift
//  Hw3
//
//  Created by IS543 on 9/29/20.
//

import Foundation

class GameOptionViewModel{
     private var themesGameOption: [ThemeViewModel] = []
    
    init(themes: [ThemeViewModel]){
        
        themesGameOption = themes
    
    }
    func getGameTheme(themeName:String)-> ThemeViewModel{
        print("sss")
        print(themeName)
        var themeEmoji = ThemeViewModel(name: "Default", color: "default", emojis: ["","",""])
        for theme in themesGameOption{
            print(theme.getName())
            if theme.getName() == themeName{
                print("my emojis in sss")
                print(theme.getEmojis())
                return theme
            }
        }
        return themeEmoji
//        return themeEmoji
    }
    
    func getGameThemeEmojis(themeName:String)-> [String]{

        var themeEmojisArray: [String] = []
        for theme in themesGameOption{
            if theme.getName() == themeName{
                themeEmojisArray = theme.getEmojis()
                return themeEmojisArray
            }
            else{
                return themeEmojisArray
            }
        }
        return themeEmojisArray
    }
    
    func getThemesforGames()->[ThemeViewModel]{
        return themesGameOption
    }
    
    func getGameThemes()-> [String]{
        
        var nameOfThemes: [String] = []
        for theme in themesGameOption {
            nameOfThemes.append(theme.getName())
        }
        return nameOfThemes
    }
    
    
    
}
