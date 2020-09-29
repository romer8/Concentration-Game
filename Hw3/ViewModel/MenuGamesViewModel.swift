//
//  MenuGamesViewModel.swift
//  Hw3
//
//  Created by IS543 on 9/28/20.
//

import Foundation

class GamesViewModel{
    
    static let nameGames = ["EmojiMojo","Temple Match","Shape Match"]
    
//    static var gamesThemes = [[String: [String]]()]

    
    var menuGameList = createMenuGameList()
        
    static func createMenuGameList()-> [GameOption]{
        var EmojiMojoThemes = initEmojiTheme()
        var gameEmoji = GameOption(game: nameGames[0],themes: EmojiMojoThemes)
        var gameTemple = GameOption(game: nameGames[1],themes: EmojiMojoThemes)
        var gameShape = GameOption(game: nameGames[2],themes: EmojiMojoThemes)

        return [gameEmoji, gameTemple, gameShape]
    }
    
    static func initEmojiTheme() -> [ThemeViewModel]{
        var emojiThemesVM: [ThemeViewModel] = []
        var emojiGeneral = [String]()
        var flagCountries = [String]()
        var Miscelanius = [String]()
        var transportMap = [String]()
        var dingBats = [String]()
        var randomEmotis = [String]()
        

        for i in 0x1F1E6...0x1F1FF {
            let c = String(UnicodeScalar(i) ?? "-")
            flagCountries.append(c)
        }
        for i in 0x2600...0x26FF {
            let c = String(UnicodeScalar(i) ?? "-")
            Miscelanius.append(c)
        }
        for i in 0x1F680...0x1F6FF {
            let c = String(UnicodeScalar(i) ?? "-")
            transportMap.append(c)
        }
        for i in 0x2700...0x27BF {
            let c = String(UnicodeScalar(i) ?? "-")
            dingBats.append(c)
        }
        for i in 0x1F601...0x1F64F {
            let c = String(UnicodeScalar(i) ?? "-")
            randomEmotis.append(c)
            emojiGeneral.append(c)

        }
       
        let generalTheme = ThemeViewModel(name: "Emoji_General", color: "fffff", emojis: emojiGeneral)
        let flagsTheme = ThemeViewModel(name: "Flags", color: "fffff", emojis: flagCountries)
        let dingbatsTheme = ThemeViewModel(name: "DingBats", color: "fffff", emojis: dingBats)
        let transportationTheme = ThemeViewModel(name: "Transportation", color: "fffff", emojis: randomEmotis)
        let randomTheme = ThemeViewModel(name: "Random", color: "fffff", emojis: emojiGeneral)
        
        emojiThemesVM.append(generalTheme)
        emojiThemesVM.append(flagsTheme)
        emojiThemesVM.append(dingbatsTheme)
        emojiThemesVM.append(transportationTheme)
        emojiThemesVM.append(randomTheme)
        
        return emojiThemesVM
    }
    
    // MARK: - Access to Model
    func getThemesforGames(option:Int)->[ThemeViewModel]{
        return menuGameList[option].themesArray
    }
    
    func getGameThemes(option:Int)-> [String]{
        let objectThemes = menuGameList[option].themesArray
        var nameOfThemes: [String] = []
        for theme in objectThemes {
            nameOfThemes.append(theme.getName())
        }
        return nameOfThemes
    }
    
    func getGameThemeEmojis(gameOption: String, themeName:String)-> [String]{
        var objectThemes: [ThemeViewModel] = []
        for gameFromMenu in menuGameList{
            if(gameFromMenu.concentrationGameName == gameOption ){
                objectThemes = gameFromMenu.themesArray
            }
        }
        var themeEmojisArray: [String] = []
        for theme in objectThemes {
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
    
    func getGameList() -> [String]{
        var gamesAvailable: [String] = []
        for game in menuGameList{
           gamesAvailable.append(game.concentrationGameName)
        }
        return gamesAvailable
    }
    // MARK: - Intents

}
