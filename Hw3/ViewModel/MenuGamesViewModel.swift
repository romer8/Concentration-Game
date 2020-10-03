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
        let EmojiMojoThemes = initEmojiTheme()
        let templeMatchThemes = initTemplesThemes()
        let shapesMatchThemes = initShapesThemes()
        let gameEmoji = GameOption(game: nameGames[0],themes: EmojiMojoThemes)
        let gameTemple = GameOption(game: nameGames[1],themes: templeMatchThemes)
        let gameShape = GameOption(game: nameGames[2],themes: shapesMatchThemes)

        return [gameTemple,gameShape,gameEmoji]
    }
    static func initTemplesThemes() -> GameOptionViewModel{
        var emojiThemesVM: [ThemeViewModel] = []
        let utahTemples: [String] = ["1u","2u","3u","4u","5u"]
        let utahTemplesTheme = ThemeViewModel(name: "Utah Temples", color: "ffff00", emojis: utahTemples)
        emojiThemesVM.append(utahTemplesTheme)
        return GameOptionViewModel(themes: emojiThemesVM)
    }
    
    static func initShapesThemes() -> GameOptionViewModel{
        var emojiThemesVM: [ThemeViewModel] = []
        
        var shapesArrayOne:[String] = []
        for index in 0...100{
            let shapeX = String(index)
            shapesArrayOne.append(shapeX)
        }
        
        var shapesArrayTwo:[String] = []
        for index in 101...200{
            let shapeX = String(index)
            shapesArrayTwo.append(shapeX)
        }
        
        var shapesArrayThree:[String] = []
        for index in 201...300{
            let shapeX = String(index)
            shapesArrayThree.append(shapeX)
        }
        
        var shapesArrayFour:[String] = []
        for index in 301...400{
            let shapeX = String(index)
            shapesArrayFour.append(shapeX)
        }
        
        let shapesOneTheme = ThemeViewModel(name: "Triangles", color: "ffff00", emojis: shapesArrayOne)
        let shapesTwoTheme = ThemeViewModel(name: "Circle", color: "69960e", emojis: shapesArrayTwo)
        let shapesThreeTheme = ThemeViewModel(name: "Stars", color: "ffa500", emojis: shapesArrayThree)
        let shapesFourTheme = ThemeViewModel(name: "Square", color: "87ceeb", emojis: shapesArrayFour)

        emojiThemesVM.append(shapesOneTheme)
        emojiThemesVM.append(shapesTwoTheme)
        emojiThemesVM.append(shapesThreeTheme)
        emojiThemesVM.append(shapesFourTheme)

        return GameOptionViewModel(themes: emojiThemesVM)
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
       
        let emojiFacesTheme = ThemeViewModel(name: "Emoji Faces", color: "ffff00", emojis: emojiFaces)
        let foodDrinksTheme = ThemeViewModel(name: "Food Drinks", color: "69960e", emojis: foodDrinks)
        let animalsTheme = ThemeViewModel(name: "Animals", color: "ffa500", emojis: animals)
        let bodyTheme = ThemeViewModel(name: "Body", color: "87ceeb", emojis: body)
        let peopleTheme = ThemeViewModel(name: "People", color: "ffc0cb ", emojis: people)
        let randomTheme = ThemeViewModel(name: "Random", color: randomHexColorCode(), emojis: randomEmotis)
        
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
//        for indx in 0...menuGameList[option].themesArray.getGameThemes().count - 1{
//            print(menuGameList[option].themesArray.getGameThemes()[indx])
//        }
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
    
    static func randomHexColorCode() -> String{
        let a = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];
        return a[Int(arc4random_uniform(15))].appending(a[Int(arc4random_uniform(15))]).appending(a[Int(arc4random_uniform(15))])
    }
    

        
        
    // MARK: - Intents

}
