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
        let utahTemples: [String] = ["u1","u2","u3","u4","u5","u6","u7","u8","u9","u10","u11","u10","u11","u12","u13","u14"]
        
        let southAmericaTemples: [String] = ["sa1","sa2","sa3","sa4","sa5","sa6","sa7","sa8","sa9","sa10","sa11","sa10","sa11","sa12","sa13","sa14","sa15","sa16","sa17","sa18","sa19","sa20","sa21"]
        
        let centralAmericaTemples: [String] = ["ca1","ca2","ca3","ca4","ca5","ca6","ca7","ca8","ca9","ca10","ca11","ca10","ca11","ca12","ca13"]
        
        let northAmericaTemples: [String] = ["na1","na2","na3","na4","na5","na6","na7","na8","na9","na10","na11","na10","na11","na12","na13","na14"]
        
        let oceaniaTemples: [String] = ["o1","o2","o3","o4","o5","o6","o7","o8","o9"]
        
        let europeTemples: [String] = ["e1","e2","e3","e4","e5","e6","e7","e8","e9","e10","e11"]

        
        let utahTemplesTheme = ThemeViewModel(name: "Utah Temples", color: randomHexColorCode(), emojis: utahTemples)
        UserDefaults.standard.set ("Never Played", forKey: "Utah Temples")

        let southAmericaTemplesTheme = ThemeViewModel(name: "South America Temples", color: randomHexColorCode(), emojis: southAmericaTemples)
        
        UserDefaults.standard.set ("Never Played", forKey: "South America Temples")

        let centralAmericaTemplesTheme = ThemeViewModel(name: "Central America Temples", color: randomHexColorCode(), emojis: centralAmericaTemples)
        
        UserDefaults.standard.set ("Never Played", forKey: "Central America Temples")

        let northAmericaTemplesTheme = ThemeViewModel(name: "North America Temples", color: randomHexColorCode(), emojis: northAmericaTemples)
        
        UserDefaults.standard.set ("Never Played", forKey: "North America Temples")

        
        let europeTemplesTheme = ThemeViewModel(name: "Europe Temples", color: randomHexColorCode(), emojis: europeTemples)
        
        UserDefaults.standard.set ("Never Played", forKey: "Europe Temples")

        let oceaniaTemplesTheme = ThemeViewModel(name: "Oceania Temples", color: randomHexColorCode(), emojis: oceaniaTemples)
        
        UserDefaults.standard.set ("Never Played", forKey: "Oceania Temples")

        
        emojiThemesVM.append(utahTemplesTheme)
        emojiThemesVM.append(southAmericaTemplesTheme)
        emojiThemesVM.append(centralAmericaTemplesTheme)
        emojiThemesVM.append(northAmericaTemplesTheme)
        emojiThemesVM.append(europeTemplesTheme)
        emojiThemesVM.append(oceaniaTemplesTheme)
        
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
        UserDefaults.standard.set ("Never Played", forKey: "Triangles")

        
        let shapesTwoTheme = ThemeViewModel(name: "Circle", color: "69960e", emojis: shapesArrayTwo)
        
        UserDefaults.standard.set ("Never Played", forKey: "Circle")

        let shapesThreeTheme = ThemeViewModel(name: "Stars", color: "ffa500", emojis: shapesArrayThree)
        
        UserDefaults.standard.set ("Never Played", forKey: "Stars")

        let shapesFourTheme = ThemeViewModel(name: "Square", color: "87ceeb", emojis: shapesArrayFour)
        UserDefaults.standard.set ("Never Played", forKey: "Square")


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
        UserDefaults.standard.set ("Never Played", forKey: "Emoji Faces")

        
        let foodDrinksTheme = ThemeViewModel(name: "Food Drinks", color: "69960e", emojis: foodDrinks)
        
        UserDefaults.standard.set ("Never Played", forKey: "Food Drinks")

        let animalsTheme = ThemeViewModel(name: "Animals", color: "ffa500", emojis: animals)
        
        UserDefaults.standard.set ("Never Played", forKey: "Animals")

        let bodyTheme = ThemeViewModel(name: "Body", color: "87ceeb", emojis: body)
        
        UserDefaults.standard.set ("Never Played", forKey: "Body")

        let peopleTheme = ThemeViewModel(name: "People", color: "ffc0cb ", emojis: people)
        
        UserDefaults.standard.set ("Never Played", forKey: "People")

        let randomTheme = ThemeViewModel(name: "Random", color: randomHexColorCode(), emojis: randomEmotis)
        
        UserDefaults.standard.set ("Never Played", forKey: "Random")

        
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
