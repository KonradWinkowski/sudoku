//
//  Cell.swift
//  sudoku
//
//  Created by Konrad Winkowski on 5/10/19.
//  Copyright © 2019 Konrad Winkowski. All rights reserved.
//

import Foundation

class Cell: Codable {
    
    var value: Int = 0
    var possibleValues: [Int] = [1,2,3,4,5,6,7,8,9]
    let identifier: Identifier
    let cluster: Identifier
    
    var isEmpty: Bool {
        return value == 0
    }
    
    init(value: Int, identifier: Identifier, cluster: Identifier) {
        self.value = value
        self.identifier = identifier
        self.cluster = cluster
    }
    
    func tryTo(setValueOnCell value: Int) -> Bool {
        if possibleValues.contains(value) {
            self.value = value
            self.possibleValues.removeAll()
            return true
        }
        return false
    }
    
    func remove(fromPossibleValues value: Int) {
        print("removing value : \(value) from possibilities : \(possibleValues)")
        possibleValues = possibleValues.filter({ $0 != value })
        print("values left after removal : \(possibleValues)")
    }
    
    func remove(fromPossibleValues value: [Int]) {
        value.forEach({ remove(fromPossibleValues: $0) })
    }
    
    func randomPossibleValue() -> Int {
        guard isEmpty else { return value }
        guard possibleValues.count > 0 else {
            fatalError("No more possible values so can't complete board")
        }
        
        let size = possibleValues.count - 1
        return possibleValues[Int.random(in: 0...size)]
    }
    
}
