//
//  FlashCard.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/2/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import Foundation
import RealmSwift

class FlashCard: Object {
    
    //MARK: - Properties
    @objc dynamic var isFrontFacing = false
    @objc dynamic var answer = ""
    @objc dynamic var question = ""
    
    //establishes Many to One relationship with FlashCardDeck
    let parentDeck = LinkingObjects(fromType: FlashCardDeck.self, property: "flashCards")
    
    
    
   
}
