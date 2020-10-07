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

        GeometryReader { geometry in
            
            ZStack{
                Image("m1b")
                   .resizable()
                   .aspectRatio(geometry.size, contentMode: .fill)
                   .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Concentration Games")
                            .bold()
                            .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)

                        Picker(selection: $selectedGame, label: Text("Select Your Story")) {
                            ForEach(0 ..< GameMenu.getGameList().count) { gameli in
                                Text(GameMenu.getGameList()[gameli])
                                    .bold()

                                    .foregroundColor(.white)


                            }
                        }
                        .onChange(of: selectedGame, perform: { _ in
                            isActive.toggle()
                        })
                        Text("You selected: \(GameMenu.getGameList()[selectedGame])")
                            .bold()
                            .padding(.bottom)
                            .foregroundColor(.white)


                        NavigationLink(destination:
                                        NavigationLazyView(
                                             GameOptionView(nameGameTitle: GameMenu.getGameList()[selectedGame], ThemesVM: GameMenu.getThemesforGames(option: selectedGame)
                                        )).navigationBarTitle("", displayMode: .inline)

                                    )
                        { Image(systemName: "play.circle.fill").font(.system(size: 50))}



                    }

                }
                
                
            }
        }

    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
