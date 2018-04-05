//
//  CreateNewFlashCardViewController.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 4/3/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit
import RealmSwift
class CreateNewFlashCardViewController: UIViewController {
    
    //MARK: - Properties
    private var isAnswerViewFaceUp = false
    var flashCardDeck: FlashCardDeck?
    let realm = try! Realm()

    //MARK: - IB Outlets
    
    //views
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var answerView: UIView!
    //textviews
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var questionTextView: UITextView!
    //labels
    @IBOutlet weak var questionAnswerLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeTextViews(textviews: [answerTextView, questionTextView])
       
        saveButton.layer.cornerRadius = 10.0
    }
    
    //MARK: - IB Actions

    @IBAction func flipButtonTapped(_ sender: UIButton) {
    
        //isAnswerViewFaecUp is initialized as true, here we switch it to true
        isAnswerViewFaceUp = !isAnswerViewFaceUp
        
        if isAnswerViewFaceUp {
        
        //Flips from questionView to answerView
        UIView.transition(from: questionView, to: answerView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
            questionAnswerLabel.text = "Answer"
            
        } else {
            
            //Flips from answerView to questionView
            UIView.transition(from: answerView, to: questionView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            
            questionAnswerLabel.text = "Question"
        }
    }
    
    @IBAction func XButtonTapped(_ sender: UIButton) {
        //dismiss self
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        //save flashCard to the flashcard deck object it belongs to
        
        do {
            try self.realm.write {
                
                let newFlashCard = FlashCard()
                newFlashCard.answer = answerTextView.text
                newFlashCard.question = questionTextView.text
                flashCardDeck?.flashCards.append(newFlashCard)
                
                }
            } catch {
                print("Error saving flashCard \(error)")
            }
        
        //dismiss self
        self.dismiss(animated: true) 
    }
    
    
    //MARK: Functions
    private func customizeTextViews(textviews: [UITextView]) {
        //loops through textviews
        for textview in textviews {
            //applies customization to each textfield
            textview.layer.cornerRadius = 10.0
        }
    }
    
   
    
    
    
}
