//
//  imageTempleView.swift
//  Hw3
//
//  Created by IS543 on 10/1/20.
//

import SwiftUI

struct imageTempleView: View {
    var fileNameString: String
    var body: some View {
        Image(fileNameString)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 2)    }
}

struct imageTempleView_Previews: PreviewProvider {
    static var previews: some View {
        imageTempleView(fileNameString:"1u")
    }
}
