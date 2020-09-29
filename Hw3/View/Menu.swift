//
//  Menu.swift
//  Hw3
//
//  Created by IS543 on 9/25/20.
//

import SwiftUI

struct Menu: View {
    var GameMenu = GamesViewModel()

    @State var selectedGame = 0
    @State var isActive = false

    var body: some View{
        NavigationView {
            VStack{
                Text("Concentration Games")
                    .bold()
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .padding()

                Picker(selection: $selectedGame, label: Text("Select Your Story")) {
                    ForEach(0 ..< GameMenu.getGameList().count) { gameli in
                        NavigationLink(GameMenu.getGameList()[gameli], destination: GameOptionView(nameGameTitle: GameMenu.getGameList()[gameli], ThemesVM: GameMenu.getThemesforGames(option: gameli)),isActive: $isActive)
                    }
                }
                .onChange(of: selectedGame, perform: { _ in
                    isActive.toggle()
                })
                .labelsHidden()
                .frame(width: 150, height: 30, alignment: .center)
                .padding()
                
                
                
//                Picker("Number of Pairs", selection: $selectedGame){
//                    ForEach(0 ..< gamesList.count) {
//                        Text(self.gamesList[$0])
//                    }
//                }

                
    //            HStack{
    //                OptionMenuView(nameGameTitle:"Emoji Mojo", Themes: EmojiMojoThemes)
    //                OptionMenuView(nameGameTitle:"Temple Match", Themes: TempleThemes)
    //            }
    //
    //            OptionMenuView(nameGameTitle:"Shape Match", Themes: TempleThemes)

            }
        }

    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
