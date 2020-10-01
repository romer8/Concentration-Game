//
//  soundEffect.swift
//  Hw3
//
//  Created by IS543 on 9/30/20.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSound(match: Bool) {
    var fileName: String
    if match{
        fileName = "applause2"
    }
    else{
        fileName = "boo2"
    }
    
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
        print("url not found")
        return
    }
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)

        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        /* iOS 10 and earlier require the following line:
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

        guard let player = player else { return }
        player.play()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            player.stop()
//        }
  
    } catch let error {
        print(error.localizedDescription)
    }
}

func stopSound(){
    player?.stop()
}

