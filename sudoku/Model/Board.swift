//
//  Board.swift
//  sudoku
//
//  Created by Konrad Winkowski on 5/10/19.
//  Copyright © 2019 Konrad Winkowski. All rights reserved.
//

import Foundation

protocol BoardUpdateDelegate: class {
    func didUpdateBoard()
}

class Board: PrintableBoard {
    
    weak var delegate: BoardUpdateDelegate?
    
    var clusters: [Cluster] = []
    
    private var steps: [Data] = []
    
    var hasEmptyCell: Bool {
        return emptyCells.first(where: { $0.isEmpty }) != nil
    }
    
    var emptyCells: [Cell] {
        return clusters.flatMap({ $0.cells.flatMap({ $0 }) }).filter({ $0.isEmpty })
    }
    
    init(with delegate: BoardUpdateDelegate) {
        self.delegate = delegate
    }
    
    func add(value: Int, toCluster clusterIdentifier: Identifier, onCell cellIdentifier: Identifier) {
        assert(value > 0 && value < 10, "Invalid value supplied")
        
        guard let cluster = clusters.first(where: { $0.identifier == clusterIdentifier }) else {
            fatalError("invalid cluster identifier provided! please check your code dummy!")
        }
        
        let cell = cluster.cell(from: cellIdentifier)
        
        guard cell.isEmpty == true else {
            print("Can't add value to cell, cell value is : \(cell.value)")
            return
        }
        
        guard cluster.isValue(validInCluster: value) else {
            print("Can't add value to cell, cluster already contains this value : \(value)")
            return
        }
        
        guard validate(rowFor: value, clusterIdentifier: cluster.identifier, cellIdentifier: cell.identifier) else {
            print("Can't add value to cell, row already contains this value : \(value)")
            return
        }
        
        guard validate(columnFor: value, clusterIdentifier: cluster.identifier, cellIdentifier: cell.identifier) else {
            print("Can't add value to cell, column already contains this value : \(value)")
            return
        }
        
        guard cell.tryTo(setValueOnCell: value) else {
            print("Failed to add value to cell, not one of possible values : \(cell.possibleValues)")
            return
        }
        
        updatePossibleValues(on: cluster, on: cell, with: value)
        printBoard()
        saveStep()
        delegate?.didUpdateBoard()
    }
    
    func saveStep() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(clusters)
            steps.append(data)
        } catch let error {
            print("Failed to encode step due to error: \(error)")
        }
        
    }
    
    func cell(for row: Int, section: Int) -> Cell {
        
        guard section < self.clusters.count else {
            return Cell(value: 0, identifier: .one, cluster: .one)
        }
        
        let cluster = self.clusters[section]
        let cell = cluster.cells[row]
        return cell
    }
    
    func validate(rowFor value: Int, clusterIdentifier: Identifier, cellIdentifier: Identifier) -> Bool {
        let clusters = self.clusters.filter( { clusterIdentifier.horizontals.contains($0.identifier) } )
        let cells = clusters.flatMap( { $0.cells.filter( { cellIdentifier.horizontals.contains($0.identifier) } ) } )
        return cells.first(where: { $0.value == value }) == nil
    }
    
    func validate(columnFor value: Int, clusterIdentifier: Identifier, cellIdentifier: Identifier) -> Bool {
        let clusters = self.clusters.filter( { clusterIdentifier.verticals.contains($0.identifier) } )
        let cells = clusters.flatMap( { $0.cells.filter( { cellIdentifier.verticals.contains($0.identifier) } ) } )
        return cells.first(where: { $0.value == value }) == nil
    }

    func updatePossibleValues(on cluster: Cluster, on cell: Cell, with value: Int) {
        cluster.remove(fromPossibleValues: value)
        let row = get(rowOfCellsFor: cluster, on: cell)
        let column = get(columnOfCellsFor: cluster, on: cell)
        
        let rowValues = row.filter({ $0.isEmpty == false }).map({ $0.value })
        let colValyes = column.filter({ $0.isEmpty == false }).map({ $0.value })
        row.forEach({ $0.remove(fromPossibleValues: rowValues) })
        column.forEach({ $0.remove(fromPossibleValues: colValyes) })
        
    }
    
    func get(rowOfCellsFor cluster: Cluster, on cell: Cell) -> [Cell] {
        let clusters = self.clusters.filter( { cluster.identifier.horizontals.contains($0.identifier) } )
        return clusters.flatMap( { $0.cells.filter( { cell.identifier.horizontals.contains($0.identifier) } ) } )
    }
    
    func get(columnOfCellsFor cluster: Cluster, on cell: Cell) -> [Cell] {
        let clusters = self.clusters.filter( { cluster.identifier.verticals.contains($0.identifier) } )
        return clusters.flatMap( { $0.cells.filter( { cell.identifier.verticals.contains($0.identifier) } ) } )
    }
    
    func setupRandomBoard() {
        
        clusters.append(Cluster(identifier: .one))
        clusters.append(Cluster(identifier: .two))
        clusters.append(Cluster(identifier: .three))
        clusters.append(Cluster(identifier: .four))
        clusters.append(Cluster(identifier: .five))
        clusters.append(Cluster(identifier: .six))
        clusters.append(Cluster(identifier: .seven))
        clusters.append(Cluster(identifier: .eight))
        clusters.append(Cluster(identifier: .nine))
        
        for _ in 0...20 {
            addRandomNumberToBoard()
        }
        
    }
    
    func addNextValue() {
        
        if let cell = emptyCells.first(where: { $0.possibleValues.count == 1 }) {
            print("found cell with only one possible value.")
            add(value: cell.possibleValues[0], toCluster: cell.cluster, onCell: cell.identifier)
        } else {
            addRandomNumberToBoard()
        }
        
    }
    
    func addRandomNumberToBoard() {
        
        guard let clusterIdentifer = Identifier.allCases.randomElement() else {
            print("Failed to get random cluster identifier")
            return
        }
        
        guard let cellIdentifier = Identifier.allCases.randomElement() else {
            print("Failed to get random cell identiifer")
            return
        }
        
        guard let cluster = clusters.first(where: {$0.identifier == clusterIdentifer}) else {
            print("Failed to get random cluster")
            return
        }
        
        let cell = cluster.cell(from: cellIdentifier)
        
        add(value: cell.randomPossibleValue(), toCluster: clusterIdentifer, onCell: cellIdentifier)
    }
    
}
