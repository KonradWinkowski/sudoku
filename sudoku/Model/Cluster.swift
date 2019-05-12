//
//  Cluster.swift
//  sudoku
//
//  Created by Konrad Winkowski on 5/10/19.
//  Copyright © 2019 Konrad Winkowski. All rights reserved.
//

import Foundation

class Cluster: Codable {
    var cells: [Cell] = []
    let identifier: Identifier
    
    var possibleValues: [Int] = [1,2,3,4,5,6,7,8,9]
    
    init(identifier: Identifier) {
        self.identifier = identifier
        
        cells.append(Cell(value: 0, identifier: .one, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .two, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .three, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .four, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .five, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .six, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .seven, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .eight, cluster: self.identifier))
        cells.append(Cell(value: 0, identifier: .nine, cluster: self.identifier))
        
    }
    
    func isValue(validInCluster value: Int) -> Bool {
        return cells.first(where: { $0.value == value }) == nil
    }
    
    func cell(valueFrom identifier: Identifier) -> Int {
        guard let cell = cells.first(where: { $0.identifier == identifier }) else { return 0 }
        return cell.value
    }
    
    func cell(from identifier: Identifier) -> Cell {
        let temp = cells.first(where: { $0.identifier == identifier })
        
        guard let cell = temp else {
            fatalError("There should be a cell here! something went massively wrong!")
        }
        
        return cell
    }
    
    func remove(fromPossibleValues value: Int) {
        possibleValues = possibleValues.filter({ $0 != value })
        for i in cells.indices {
            cells[i].remove(fromPossibleValues: value)
        }
    }
    
}
