//
//  Hw3App.swift
//  Hw3
//
//  Created by IS543 on 9/9/20.
//

import SwiftUI

@main
struct Hw3App: App {
    var body: some Scene {
        WindowGroup {
            EmojiConcentrationGameView(emojiGame: EmojiConcentrationGame() )
        }
    }
}

