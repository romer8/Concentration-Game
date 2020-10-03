//
//  CGFloat+random.swift
//  Hw3
//
//  Created by IS543 on 10/1/20.
//

import Foundation
import SwiftUI

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
