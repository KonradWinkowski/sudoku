//
//  ViewController.swift
//  sudoku
//
//  Created by Konrad Winkowski on 5/10/19.
//  Copyright © 2019 Konrad Winkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView?
    
    lazy var board: Board = {
        return Board(with: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UINib(nibName: "SimpleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        board.setupRandomBoard()
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        board.addNextValue()
    }
    
}

extension ViewController: BoardUpdateDelegate {
    func didUpdateBoard() {
        collectionView?.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SimpleCollectionViewCell
        
        let data = board.cell(for: indexPath.row, section: indexPath.section)
        cell.currentLbl.text = "\(data.value)"
        var str = ""
        data.possibleValues.forEach({
            str += "\($0), "
        })
        cell.possibleLbl.text = str
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}




