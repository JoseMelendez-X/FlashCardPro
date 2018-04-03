//
//  FlashCardDecksCollectionViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/2/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FlashCardDecksCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //perfer large titles
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
