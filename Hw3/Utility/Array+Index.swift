//
//  Array+Index.swift
//  Hw3
//
//  Created by IS543 on 9/16/20.
//

import Foundation
extension Array where Element: Identifiable{
    func firstIndex(matching element: Element)-> Int?{
        for index in 0..<self.count{
            if self[index].id == element.id{
                return index
            }
        }
        return nil
    }
}
