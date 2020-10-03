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
        let themeEmoji = ThemeViewModel(name: "Default", color: "default", emojis: ["","",""])
        for theme in themesGameOption{
//            print(theme.getName())
//            print(themeName)
            if theme.getName() == themeName{
//                print("good job")
                return theme
            }
        }
        return themeEmoji
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
        print(themesGameOption.count)
        for indx in 0...themesGameOption.count - 1{
            print(themesGameOption[indx].getName())
        }
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
