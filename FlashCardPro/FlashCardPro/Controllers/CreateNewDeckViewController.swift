//
//  CreateNewDeckViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/3/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit

class CreateNewDeckViewController: UIViewController {

    //MARK: - IB Actions
    
    //Create a new deck on flashCardDecks view controller and dismiss itself
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        //dimiss itself
        self.dismiss(animated: true, completion: nil)
    }

}
