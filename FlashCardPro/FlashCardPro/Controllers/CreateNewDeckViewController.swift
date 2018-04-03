//
//  CreateNewDeckViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/3/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit
import TextFieldEffects

class CreateNewDeckViewController: UIViewController {
    
    
    //MARK: - IB Outlets
    @IBOutlet weak var flashCardTitleTextField: HoshiTextField!
    
    @IBOutlet weak var doneButton: UIButton!{
        didSet {
            //makes button edges rounded
            doneButton.layer.cornerRadius = 12.0
        }
    }
    
    //MARK: - IB Actions
    
    @IBAction func XButtonTapped(_ sender: UIButton) {
        
        //dimiss self
        self.dismiss(animated: true, completion: nil)
    }
    //Create a new deck on flashCardDecks view controller and dismiss itself
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        //dimiss self
        self.dismiss(animated: true, completion: nil)
    }

}
