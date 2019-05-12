//
//  Identifier.swift
//  sudoku
//
//  Created by Konrad Winkowski on 5/10/19.
//  Copyright © 2019 Konrad Winkowski. All rights reserved.
//

import Foundation

enum Identifier: Int, Codable, CaseIterable {
    
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var horizontals: [Identifier] {
        switch self {
        case .one,
             .two,
             .three:
            return [.one, .two, .three]
        case .four,
             .five,
             .six:
            return [.four, .five, .six]
        case .seven,
             .eight,
             .nine:
            return [.seven, .eight, .nine]
        }
    }
    
    var verticals: [Identifier] {
        switch self {
        case .one,
             .four,
             .seven:
            return [.one, .four, .seven]
        case .two,
             .five,
             .eight:
            return [.two, .five, .eight]
        case .three,
             .six,
             .nine:
            return [.three, .six, .nine]
        }
    }
    
}
