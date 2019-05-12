//
//  SimpleCollectionViewCell.swift
//  sudoku
//
//  Created by Konrad Winkowski on 5/10/19.
//  Copyright © 2019 Konrad Winkowski. All rights reserved.
//

import UIKit

class SimpleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var possibleLbl: UILabel!
    @IBOutlet weak var currentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
