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
    
    static func initEmojiTheme() -> GameOptionViewModel {
        var emojiThemesVM: [ThemeViewModel] = []
        var emojiFaces = [String]()
        var foodDrinks = [String]()
        var animals = [String]()
        var body = [String]()
        var people = [String]()
        var randomEmotis = [String]()
        

        for i in 0x1F347...0x1F9C9 {
            let c = String(UnicodeScalar(i) ?? "-")
            foodDrinks.append(c)
        }
        for i in 0x1F600...0x1F92C{
            let c = String(UnicodeScalar(i) ?? "-")
            emojiFaces.append(c)
        }
        for i in 0x1F444...0x1F44B {
            let c = String(UnicodeScalar(i) ?? "-")
            body.append(c)
        }
        for i in 0x1F476...0x1F9D9 {
            let c = String(UnicodeScalar(i) ?? "-")
            people.append(c)
        }
        for i in 0x1F435...0x1F996 {
            let c = String(UnicodeScalar(i) ?? "-")
            animals.append(c)
        }
        for i in 0x2623...0x1F600 {
            let c = String(UnicodeScalar(i) ?? "-")
            randomEmotis.append(c)
        }
       
        let emojiFacesTheme = ThemeViewModel(name: "Emoji Faces", color: "fffff", emojis: emojiFaces)
        let foodDrinksTheme = ThemeViewModel(name: "Food Drinks", color: "fffff", emojis: foodDrinks)
        let animalsTheme = ThemeViewModel(name: "Animals", color: "fffff", emojis: animals)
        let bodyTheme = ThemeViewModel(name: "Body", color: "fffff", emojis: body)
        let peopleTheme = ThemeViewModel(name: "People", color: "fffff", emojis: people)
        let randomTheme = ThemeViewModel(name: "Random", color: "fffff", emojis: randomEmotis)
        
        emojiThemesVM.append(emojiFacesTheme)
        emojiThemesVM.append(foodDrinksTheme)
        emojiThemesVM.append(animalsTheme)
        emojiThemesVM.append(bodyTheme)
        emojiThemesVM.append(peopleTheme)
        emojiThemesVM.append(randomTheme)
        
        return GameOptionViewModel(themes: emojiThemesVM)
    }
    
    // MARK: - Access to Model
    func getThemesforGames(option:Int)-> GameOptionViewModel{
        return menuGameList[option].themesArray
    }
    
    func getGameThemes(option:Int)-> [String]{
        let objectThemes = menuGameList[option].themesArray.getThemesforGames()
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
                objectThemes = gameFromMenu.themesArray.getThemesforGames()
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
