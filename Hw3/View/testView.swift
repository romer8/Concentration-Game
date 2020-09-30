//
//  testView.swift
//  Hw3
//
//  Created by IS543 on 9/28/20.
//

import SwiftUI

struct testView: View {

    var body: some View {
        Text(String(UnicodeScalar(0x1F680) ?? "-")).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
