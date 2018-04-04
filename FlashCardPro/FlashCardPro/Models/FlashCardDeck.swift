//
//  FlashCardDeck.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/2/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import Foundation
import RealmSwift

class FlashCardDeck: Object {
    
    //Mark: - Properties
    @objc dynamic var name = ""
    
    //array of flashcards, One to Many relationship
    let flashCards = List<FlashCard>()
    
    //MARK: - Functions
    
    //remove flashcards
    
    //add flashcards
}

