//
//  OptionMenuView.swift
//  Hw3
//
//  Created by IS543 on 9/25/20.
//

import SwiftUI

struct OptionMenuView: View {
    @State var nameGameTitle: String
    @State var selectionThemes = 0
    @State var Themes: [String]
    
    @State var selectionPairs = 0
    @State var numberPairsLimit = 10
    var body: some View {
        VStack{
            Text(nameGameTitle).bold()
                .font(.title)
                .padding(.bottom)
            Text("Themes").bold()
            
            Picker("Themes",selection: $selectionThemes) {
               ForEach(0 ..< Themes.count) {
                  Text(self.Themes[$0])
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
        OptionMenuView(nameGameTitle: "EmojiMojo", Themes:["Halloween","Fruits","Emojis","Animals","Music","Cars"])
    }
}
