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
    
    var selectedFlashCardDeck: FlashCardDeck?
    
    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var emptyDataView: UIView!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //set edit bar button item
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        //perfer large titles
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
        
        
        if loadFlashCardDecks().count == 0 {
            emptyDataView.isHidden = false
        } else {
            emptyDataView.isHidden = true
        }
        
    }
    
    
    //MARK: Required Data Source Functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return loadFlashCardDecks().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FlashCardDeckCollectionViewCell
        cell.delegate = self
        cell.flashCardDeckTitleLabel.text = loadFlashCardDecks()[indexPath.row].name
        //custom configuration of the cell
        cell.configureCell()
        
        return cell
    }
    
    //MARK: Delegate Functions
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //gets the selectedFlashCardDeck
        selectedFlashCardDeck = loadFlashCardDecks()[indexPath.row]
        
        //perfrom segue
        self.performSegue(withIdentifier: "toFlashCardsVC", sender: self)

    }
    
    
    //MARK: - Functions Saving and Reading
    
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
    
    
    
    //Read FlashCardDecks, returns all of the FlashCardDeck Objects
    func loadFlashCardDecks() -> Results<FlashCardDeck> {
        return realm.objects(FlashCardDeck.self)
    }
    
    //MARK: Functions prepareforsegue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFlashCardsVC" {
            let destinationVC = segue.destination as! FlashCardsViewController
            //pass the selectedFlashCardDeck foward to destinationVC
            destinationVC.flashCardDeck = selectedFlashCardDeck
        }
    }
    
    //MARK: Editing
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        
        //disable add button
        addBarButtonItem.isEnabled = !editing
        //indexpaths of the collection view cells
        if let indexPaths = collectionView?.indexPathsForVisibleItems {
            for indexPath in indexPaths {
                if let cell = collectionView?.cellForItem(at: indexPath) as? FlashCardDeckCollectionViewCell{
                    cell.isEditing = editing

                }
            }
        }
    }

}


//MARK: Delete flash card decks
extension FlashCardDecksCollectionViewController: FlashCardDeckDelegate {
    
    func delete(cell: FlashCardDeckCollectionViewCell) {
        if let indexPath = collectionView?.indexPath(for: cell) {
            
                    let alertController = UIAlertController(title: "Delete Deck", message: "Are you sure you want to delete the deck of flash cards?", preferredStyle: .alert)
            
                    let alertAction = UIAlertAction(title: "Yes, delete the deck", style: .destructive) { (action) in
                        do {
                            try self.realm.write {
                            //do something
                                let deck = self.realm.objects(FlashCardDeck.self)
                                self.realm.delete(deck[indexPath.row].flashCards)
                                self.realm.delete(deck[indexPath.row])
                                //delete item from collection view
                                self.collectionView?.deleteItems(at: [indexPath])
                            
                            }
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    }
            
                    alertController.addAction(alertAction)
                    alertController.addAction(cancelAction)
                    present(alertController, animated: true, completion: nil)
        }
    }
}

