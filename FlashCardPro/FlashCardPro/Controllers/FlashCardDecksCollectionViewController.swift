//
//  FlashCardDecksCollectionViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/2/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FlashCardCell"

class FlashCardDecksCollectionViewController: UICollectionViewController {
    
    var names = ["Swift Interview Questions", "Math and Physics Questions", "Chapter 3 Geology Test Review"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //perfer large titles
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    //MARK: Required Data Source Functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return names.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FlashCardDeckCollectionViewCell
        
        
        cell.flashCardDeckTitleLabel.text = names[indexPath.row]
        //custom configuration of the cell
        cell.configureCell()
        
        return cell
    }
}
