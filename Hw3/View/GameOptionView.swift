//
//  OptionMenuView.swift
//  Hw3
//
//  Created by IS543 on 9/25/20.
//

import SwiftUI

struct GameOptionView: View {
    @State var nameGameTitle: String
    @State var selectionThemes = 0
    @State var ThemesVM: [ThemeViewModel]
    
    @State var selectionPairs = 0
    @State var numberPairsLimit = 10
    var body: some View {
        VStack{
            Text(nameGameTitle).bold()
                .font(.title)
                .padding(.bottom)
            Text("Themes").bold()
            
            Picker("Themes",selection: $selectionThemes) {
               ForEach(0 ..< ThemesVM.count) { themevm in
                Text(self.ThemesVM[themevm].getName())
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
            Button("Play"){

            }
            .padding()
        }
        
    }
}

struct OptionMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionView(nameGameTitle: "EmojiMojo", ThemesVM: [ThemeViewModel(name: "hola", color: "fffff", emojis: ["sss","sss","sss"])])

    }
}
