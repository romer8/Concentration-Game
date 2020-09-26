//
//  Menu.swift
//  Hw3
//
//  Created by IS543 on 9/25/20.
//

import SwiftUI

struct Menu: View {
    private var EmojiMojoThemes = ["Halloween","Fruits","Emojis","Animals","Music","Cars"]
//    private var TempleThemes = ["SouthAmerica","Utah","Asia","Europe","NorthAmerica","Africa"]
    private var gamesList = ["Emoji Mojo", "Temple Match", "Shape Match"]
    @State var selectedGame = 0
    @State var isActive = false


    var body: some View {
        NavigationView {

            VStack{
                Text("Concentration Games")
                    .bold()
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .padding()
                Text("select a game:")
                    .padding()
                    .font(.system(size: 20))
                Picker(selection: $selectedGame, label: Text("Select Your Story")) {
                    ForEach(0 ..< gamesList.count) { gameli in
                        NavigationLink(gamesList[gameli],
                                       destination: OptionMenuView(nameGameTitle:"Emoji Mojo", Themes: EmojiMojoThemes),
                                       isActive: $isActive)
                    }
                }
                .onChange(of: selectedGame, perform: { _ in
                    isActive.toggle()
                })
                
                
                
//                Picker("Number of Pairs", selection: $selectedGame){
//                    ForEach(0 ..< gamesList.count) {
//                        Text(self.gamesList[$0])
//                    }
//                }
//                .labelsHidden()
//                .frame(width: 150, height: 30, alignment: .center)
//                .padding()
                
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
