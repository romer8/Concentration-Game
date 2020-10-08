//
//  toggleCustom.swift
//  Hw3
//
//  Created by IS543 on 10/3/20.
//

import Foundation
import SwiftUI

struct SoundToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Image(systemName: configuration.isOn ? "speaker" : "speaker.slash")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 14, height: 15)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
