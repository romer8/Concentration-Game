//
//  ScoresView.swift
//  Hw3
//
//  Created by IS543 on 10/5/20.
//

import SwiftUI

struct ScoresView: View {
    var themesNames: [String] = []
    var gameTitle: String = "Default"
    var arrayScores:[String]{
        var tmpArray: [String] = []
        for theme in themesNames{
            let tmp = UserDefaults.standard.object(forKey: theme) as? String ?? ""
            tmpArray.append(tmp)
        }
        return tmpArray
    }
    
    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 1)
    var body: some View {
        GeometryReader { geometry in

            ZStack{
                if gameTitle == "Shape Match"{
                    Rectangle().fill(Color.black)
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                }
                else if gameTitle == "EmojiMojo"{
                    Rectangle().fill(Color.pink)
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                }
                else if gameTitle == "Temple Match"{
                    Rectangle().fill(Color.purple)
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                }
                ScrollView {
                    Text(gameTitle).foregroundColor(.white)
                     LazyVGrid(columns: columns) {
                        ForEach(themesNames, id: \.self) {theme in
                            let index = themesNames.firstIndex(of: theme)
                            HStack{
                                Text(theme).bold().foregroundColor(.white)
                                Spacer()
                                Spacer()
                                Text(arrayScores[index ?? 0]).foregroundColor(.white)
                            }.padding()

                         }
                     }
                 }
                
            }.padding(.top, geometry.size.height * 0.1)
        }
        
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}
