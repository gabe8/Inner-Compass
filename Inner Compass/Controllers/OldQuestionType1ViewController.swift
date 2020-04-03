//
//  QuestionType1ViewController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 1/31/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class OldQuestionType1ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionDescriptionLabel: UILabel!
    @IBOutlet weak var brainstormTextField: UITextView!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var submitAnswerButton: UIButton!
    
    //Set an instance of the QuestionBrain Struct
    var questionBrain = ContentModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Set the color of the UITextView to match the UITextFields below
        brainstormTextField.textColor = UIColor.lightGray
        
        //Create a border, border color and corner radius to match the UITextField instances below.  Color will need to be set manually for dark mode
        brainstormTextField.layer.borderColor = UIColor.lightGray.cgColor
        brainstormTextField.layer.borderWidth = 1
        brainstormTextField.layer.cornerRadius = 6
        
        //Set the corners of the Submit Answer button to be round
        submitAnswerButton.layer.cornerRadius = 25
        
        //Set the QuestionType1ViewController as a delegate for brainstormTextField
        brainstormTextField.delegate = self
        
        //Set the QuestionType1ViewController as a delegate for the three UITextFields
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        
        //Have the form load the appropriate question and description
        updateUI()
        
    }
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        
        //When the user clicks the submit answer button, save response, move counter to next question, update form to that
        //question
  
        questionBrain.nextQuestion()
        
        updateUI()
        
        //This tells the text fields that we're done editing and dismiss the keyboard
        firstTextField.endEditing(true)
        secondTextField.endEditing(true)
        thirdTextField.endEditing(true)
        
        
        
           
    }
    
    
    //Set the labels to contain the question sentence and description for a given question in the survey.
    func updateUI() {
        questionLabel.text = questionBrain.getQuestionMain()
        questionDescriptionLabel.text = questionBrain.getQuestionDescription()
    }
    
}

extension OldQuestionType1ViewController: UITextViewDelegate {
    
    //when the user begins to edit the text view, if the text view contains a placeholder (i.e. if its text color is light
    //gray) clear the placeholder text and set the text color to black in order to accommodate the user's entry.
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    //When the user finishes editing the text view and it's resigned as the first responder, if the text view is empty, reset
    //its placeholder by re-adding the placeholder text and setting its color to light gray.
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Need to brainstorm? Use this field to do so.  Nothing you type here will be submitted as your answer..."
            textView.textColor = UIColor.lightGray
        }
    }
}

extension OldQuestionType1ViewController: UITextFieldDelegate {

    //This function is called when the user presses the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //When user presses the return button, switch the first responder status to the next field.
        switch textField {
        case firstTextField:
            secondTextField.becomeFirstResponder()
        case secondTextField:
            thirdTextField.becomeFirstResponder()
        case thirdTextField:
            thirdTextField.becomeFirstResponder()
        default:
            thirdTextField.becomeFirstResponder()
        }
        
        return true
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//
//        if firstTextField.isFirstResponder == true {
//
//
//
//
//        }
//
//        return true
//    }
}
