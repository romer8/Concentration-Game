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
    @State var numberPairsLimit = 100
    @State var fontColorView: Color = .white
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if nameGameTitle == "Temple Match"{
                    Image("sm1")
                       .resizable()
                       .aspectRatio(geometry.size, contentMode: .fill)
                       .edgesIgnoringSafeArea(.all)
                }
                else if nameGameTitle == "EmojiMojo"{
                    Image("sm2")
                       .resizable()
                       .aspectRatio(geometry.size, contentMode: .fill)
                       .edgesIgnoringSafeArea(.all)
                }
                else if nameGameTitle == "Shape Match"{
                    Image("sm3")
                       .resizable()
                       .aspectRatio(geometry.size, contentMode: .fill)
                       .edgesIgnoringSafeArea(.all)
                }

        VStack{
            Text(nameGameTitle).bold()
                .font(.title)
                .foregroundColor(fontColorView)
                .padding(.bottom)
            
            Text("Themes").bold()
                .foregroundColor(fontColorView)
                .padding(.top)
            
            Picker("Themes",selection: $selectionThemes) {
                Text("Select Theme")
                ForEach(0 ..< ThemesVM.getThemesforGames().count) { themevm in
                    Text(self.ThemesVM.getThemesforGames()[themevm].getName()).bold()
                        .foregroundColor(fontColorView)
                    
               }
            }
            .labelsHidden()
            .frame(width: 300, height: 30, alignment: .center)
            .clipped()
            
            Text("Pairs")
                .bold()
                .foregroundColor(fontColorView)


            Picker("Number of Pairs", selection: $selectionPairs){
                ForEach(1 ..< (ThemesVM.getThemesforGames()[selectionThemes].getEmojis().count + 1 < numberPairsLimit ? ThemesVM.getThemesforGames()[selectionThemes].getEmojis().count + 1: numberPairsLimit + 1 )) {
                    Text("\($0) pairs").bold()
                        .foregroundColor(fontColorView)

                }
            }.id(selectionThemes)
            .labelsHidden()
            .frame(width: 150, height: 30, alignment: .center)
            .clipped()
            NavigationLink(destination:
                            NavigationLazyView(
                                EmojiConcentrationGameView(emojiGame:EmojiConcentrationGame(name: nameGameTitle, themevm: ThemesVM.getGameTheme(themeName: ThemesVM.getThemesforGames()[selectionThemes].getName()), numberCards: selectionPairs))
                            
                            ).navigationBarTitle("", displayMode: .inline)

                        )
                { Text("▶️") }.padding()
            
            Text("You selected: \(ThemesVM.getThemesforGames()[selectionThemes].getName())")
                .foregroundColor(fontColorView)

            Text("You selected: \(selectionPairs + 1) \(" pairs")")
                .foregroundColor(fontColorView)

            
            NavigationLink(destination: NavigationLazyView(
                ScoresView(themesNames: ThemesVM.getGameThemes(), gameTitle: nameGameTitle)) )
            {HStack(spacing: 10) {
                Image(systemName: "square.and.pencil")
                Text("Scores")
                    .foregroundColor(fontColorView)

            } }.padding()

        }
            }
        }
    }
}

struct OptionMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionView(nameGameTitle: "EmojiMojo", ThemesVM: GameOptionViewModel(themes: [ThemeViewModel(name: "hola", color: "fffff", emojis: ["sss","sss","sss"])]))

    }
}
