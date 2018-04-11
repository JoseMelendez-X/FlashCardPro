//
//  FlashCardDeckCollectionViewCell.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/2/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit
import RealmSwift

protocol FlashCardDeckDelegate: class {
    
    func delete(cell: FlashCardDeckCollectionViewCell)
    
}

class FlashCardDeckCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    weak var delegate: FlashCardDeckDelegate?
    let realm = try! Realm()
    
    //MARK: IB Outlets
    @IBOutlet weak var flashCardDeckTitleLabel: UILabel!{
        didSet{
            deleteButton.isHidden = !isEditing
        }
    }
    
    var isEditing = false {
        didSet{
            deleteButton.isHidden = !isEditing
        }
    }
    @IBOutlet weak var deleteButton: UIButton!
    
    //MARK: IB Actions
    @IBAction func deleteFlashCardButtonTapped(_ sender: UIButton) {
        
        delegate?.delete(cell: self)
        
    }
    
}

