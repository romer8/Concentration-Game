//
//  Menu.swift
//  Hw3
//
//  Created by IS543 on 9/25/20.
//

import SwiftUI

struct Menu: View {
    private var EmojiMojoThemes = ["Halloween","Fruits","Emojis","Animals","Music","Cars"]
    private var TempleThemes = ["SouthAmerica","Utah","Asia","Europe","NorthAmerica","Africa"]

    var body: some View {
        VStack{
            Text("Concentration Games")
                .bold()
                .font(.system(size: 40))
                .multilineTextAlignment(.center)
                .padding()
                .font(.system(size: 20))
            HStack{
                OptionMenuView(nameGameTitle:"Emoji Mojo", Themes: EmojiMojoThemes)
                OptionMenuView(nameGameTitle:"Temple Match", Themes: TempleThemes)
            }

            OptionMenuView(nameGameTitle:"Shape Match", Themes: TempleThemes)


        }

    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
