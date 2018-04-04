//
//  FlashCardsViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/3/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit

class FlashCardsViewController: UIViewController {

    //MARK: - Properties
    var flashCardDeck: FlashCardDeck?
    
    
    //MARK: - Functions
    
    //Pass flashCard object to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateNewFlashCardVC" {
            let destinationVC = segue.destination as! CreateNewFlashCardViewController
            destinationVC.flashCardDeck = flashCardDeck
        }
    }

}
