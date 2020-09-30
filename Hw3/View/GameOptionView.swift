//
//  OptionMenuView.swift
//  Hw3
//
//  Created by IS543 on 9/25/20.
//

import SwiftUI

struct GameOptionView: View {
    @State var nameGameTitle: String
    @State private var selectionThemes: Int = 0
    @State var ThemesVM: GameOptionViewModel
    @State var isNav: Bool = false
    
    @State var selectionPairs = 0
    @State var numberPairsLimit = 10
    var body: some View {
        VStack{
            Text(nameGameTitle).bold()
                .font(.title)
                .padding(.bottom)
            Text("Themes").bold()
            
            Picker("Themes",selection: $selectionThemes) {
                Text("Select Theme")
                ForEach(0 ..< ThemesVM.getThemesforGames().count) { themevm in
                    Text(self.ThemesVM.getThemesforGames()[themevm].getName())
                    

               }
            }
            .labelsHidden()
            .frame(width: 150, height: 30, alignment: .center)
            .clipped()
            
            Text("Pairs").bold()

            Picker("Number of Pairs", selection: $selectionPairs){
                ForEach(1 ..< numberPairsLimit + 1) {
                    Text("\($0) pairs")
                }
            }
            .labelsHidden()
            .frame(width: 150, height: 30, alignment: .center)
            .clipped()
            NavigationLink(destination:
                            NavigationLazyView(
                                EmojiConcentrationGameView(emojiGame:EmojiConcentrationGame(name: nameGameTitle, themevm: ThemesVM.getGameTheme(themeName: ThemesVM.getThemesforGames()[selectionThemes].getName()), numberCards: selectionPairs))
                            
                            )
                        )
                { Text("▶️") }.padding()
            Text("You selected: \(ThemesVM.getThemesforGames()[selectionThemes].getName())")
            Text("You selected: \(selectionPairs + 1) \(" pairs")")

        }
        
    }
}

struct OptionMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionView(nameGameTitle: "EmojiMojo", ThemesVM: GameOptionViewModel(themes: [ThemeViewModel(name: "hola", color: "fffff", emojis: ["sss","sss","sss"])]))

    }
}
