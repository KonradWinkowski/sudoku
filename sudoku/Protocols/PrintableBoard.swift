//
//  PrintableBoard.swift
//  sudoku
//
//  Created by Konrad Winkowski on 5/10/19.
//  Copyright © 2019 Konrad Winkowski. All rights reserved.
//

import Foundation

protocol PrintableBoard where Self: Board {
}

extension PrintableBoard {
    func printBoard() {
        let clusters = self.clusters
        print("""
            -------------------------
            | \(clusters[0].cell(valueFrom: .one)) \(clusters[0].cell(valueFrom: .two)) \(clusters[0].cell(valueFrom: .three)) | \(clusters[1].cell(valueFrom: .one)) \(clusters[1].cell(valueFrom: .two)) \(clusters[1].cell(valueFrom: .three)) | \(clusters[2].cell(valueFrom: .one)) \(clusters[2].cell(valueFrom: .two)) \(clusters[2].cell(valueFrom: .three)) |
            | \(clusters[0].cell(valueFrom: .four)) \(clusters[0].cell(valueFrom: .five)) \(clusters[0].cell(valueFrom: .six)) | \(clusters[1].cell(valueFrom: .four)) \(clusters[1].cell(valueFrom: .five)) \(clusters[1].cell(valueFrom: .six)) | \(clusters[2].cell(valueFrom: .four)) \(clusters[2].cell(valueFrom: .five)) \(clusters[2].cell(valueFrom: .six)) |
            | \(clusters[0].cell(valueFrom: .seven)) \(clusters[0].cell(valueFrom: .eight)) \(clusters[0].cell(valueFrom: .nine)) | \(clusters[1].cell(valueFrom: .seven)) \(clusters[1].cell(valueFrom: .eight)) \(clusters[1].cell(valueFrom: .nine)) | \(clusters[2].cell(valueFrom: .seven)) \(clusters[2].cell(valueFrom: .eight)) \(clusters[2].cell(valueFrom: .nine)) |
            -------------------------
            | \(clusters[3].cell(valueFrom: .one)) \(clusters[3].cell(valueFrom: .two)) \(clusters[3].cell(valueFrom: .three)) | \(clusters[4].cell(valueFrom: .one)) \(clusters[4].cell(valueFrom: .two)) \(clusters[4].cell(valueFrom: .three)) | \(clusters[5].cell(valueFrom: .one)) \(clusters[5].cell(valueFrom: .two)) \(clusters[5].cell(valueFrom: .three)) |
            | \(clusters[3].cell(valueFrom: .four)) \(clusters[3].cell(valueFrom: .five)) \(clusters[3].cell(valueFrom: .six)) | \(clusters[4].cell(valueFrom: .four)) \(clusters[4].cell(valueFrom: .five)) \(clusters[4].cell(valueFrom: .six)) | \(clusters[5].cell(valueFrom: .four)) \(clusters[5].cell(valueFrom: .five)) \(clusters[5].cell(valueFrom: .six)) |
            | \(clusters[3].cell(valueFrom: .seven)) \(clusters[3].cell(valueFrom: .eight)) \(clusters[3].cell(valueFrom: .nine)) | \(clusters[4].cell(valueFrom: .seven)) \(clusters[4].cell(valueFrom: .eight)) \(clusters[4].cell(valueFrom: .nine)) | \(clusters[5].cell(valueFrom: .seven)) \(clusters[5].cell(valueFrom: .eight)) \(clusters[5].cell(valueFrom: .nine)) |
            -------------------------
            | \(clusters[6].cell(valueFrom: .one)) \(clusters[6].cell(valueFrom: .two)) \(clusters[6].cell(valueFrom: .three)) | \(clusters[7].cell(valueFrom: .one)) \(clusters[7].cell(valueFrom: .two)) \(clusters[7].cell(valueFrom: .three)) | \(clusters[8].cell(valueFrom: .one)) \(clusters[8].cell(valueFrom: .two)) \(clusters[8].cell(valueFrom: .three)) |
            | \(clusters[6].cell(valueFrom: .four)) \(clusters[6].cell(valueFrom: .five)) \(clusters[6].cell(valueFrom: .six)) | \(clusters[7].cell(valueFrom: .four)) \(clusters[7].cell(valueFrom: .five)) \(clusters[7].cell(valueFrom: .six)) | \(clusters[8].cell(valueFrom: .four)) \(clusters[8].cell(valueFrom: .five)) \(clusters[8].cell(valueFrom: .six)) |
            | \(clusters[6].cell(valueFrom: .seven)) \(clusters[6].cell(valueFrom: .eight)) \(clusters[6].cell(valueFrom: .nine)) | \(clusters[7].cell(valueFrom: .seven)) \(clusters[7].cell(valueFrom: .eight)) \(clusters[7].cell(valueFrom: .nine)) | \(clusters[8].cell(valueFrom: .seven)) \(clusters[8].cell(valueFrom: .eight)) \(clusters[8].cell(valueFrom: .nine)) |
            -------------------------
            """)
    }
}
