//
//  FlashCardDecksCollectionViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/2/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "FlashCardCell"

class FlashCardDecksCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    
    //realm object
    let realm = try! Realm()
 
    
    //MARK: 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //perfer large titles
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    
    //MARK: Required Data Source Functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return loadFlashCardDecks().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FlashCardDeckCollectionViewCell
        
        
        cell.flashCardDeckTitleLabel.text = loadFlashCardDecks()[indexPath.row].name
        //custom configuration of the cell
        cell.configureCell()
        
        return cell
    }
    
    
    //MARK: - Functions
    
    //Save FlashCardDeck
    func save(flashcardDeck: FlashCardDeck) {
        do {
            try realm.write {
                realm.add(flashcardDeck)
            }
        } catch {
            print("error saving FlashCardDeck \(error.localizedDescription)")
        }
    }
    
    
    
    //returns all of the FlashCardDeck Objects
    func loadFlashCardDecks() -> Results<FlashCardDeck> {
        return realm.objects(FlashCardDeck.self)
    }

}

