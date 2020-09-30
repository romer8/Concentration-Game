//
//  NavigationLazyView.swift
//  Hw3
//
//  Created by IS543 on 9/29/20.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}


