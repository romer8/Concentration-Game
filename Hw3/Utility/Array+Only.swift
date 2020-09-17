//
//  Array+Only.swift
//  Hw3
//
//  Created by IS543 on 9/16/20.
//

import Foundation

extension Array{
    var only:Element? {
        count == 1 ? first : nil
    }
    
}
