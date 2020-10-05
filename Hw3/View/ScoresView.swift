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
        print(tmpArray)
        return tmpArray
    }
    
    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 1)
    var body: some View {
        Text(gameTitle).font(.title)
        ScrollView {
             LazyVGrid(columns: columns) {
                ForEach(themesNames, id: \.self) {theme in
                    let index = themesNames.firstIndex(of: theme)
                    HStack{
                        Text(theme)
                        Spacer()
                        Spacer()
                        Text(arrayScores[index ?? 0])
                    }.padding()

                 }
             }
         }
        
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}
