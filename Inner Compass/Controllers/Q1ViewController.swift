//
//  TestViewController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 2/15/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class Q1ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questionBrain = QuestionBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
 
    }
//    override func viewWillAppear(_ animated: Bool) {
//          super.viewWillAppear(animated)
//          progressBar.progress = 0.1
//          progressBarLabel.text = "Question 1 out of 10"
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Q1ViewController: UITableViewDataSource {
    
    // This method sets the total numer of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // This method will be called however many times is indicated by the numer of rows above and sets the cell.  It creates
    // the content for the cell as well unless indicated in the custom class file
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Test1", for: indexPath)
//            cell.textLabel?.text = "Hello can you see me?"
//            return cell

        
        
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionField", for: indexPath) as! Q1QuestionCell
            cell.q1QuestionLabel.text = questionBrain.getQuestionMain()
            //cell.textLabel?.text = "Hello can you see me 1?"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionField", for: indexPath) as! Q1DescriptionCell
            cell.q1DescriptionLabel.text = questionBrain.getQuestionDescription()
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Test2", for: indexPath) as! Q1DescriptionCell
            cell.q1DescriptionLabel.text = questionBrain.getQuestionDescription()
            return cell
        case 3:
            
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Test1", for: indexPath)
            cell.textLabel?.text = "Hello can you see me 1?"
            return cell

        }

        // This is where we would populate the cells with the correct data for the current question.
              // This will require subclassing UITableViewCell for each of our prototypes, in order to have
              // IBOutlets to the labels or textfields within the cell, depending on which prototype it is.
              
    }
    
    
    
    
}
//
//switch indexPath.row {
//case 0:
//    let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! q1QuestionCell
//    cell.questionLabel.text = "1. TEST 1 2?"
//    return cell
//case 1, 2:
//    let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath)
//    cell.textLabel?.text = "can you see this?"
//    return cell
//case 3, 4, 5:
//    let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerFieldCell", for: indexPath)
//    return cell
//case 6:
//    let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitButtonCell", for: indexPath)
//    return cell
//default: break
//}



//extension QType1ViewController: UITextViewDelegate {
//
//    //when the user begins to edit the text view, if the text view contains a placeholder (i.e. if its text color is light
//    //gray) clear the placeholder text and set the text color to black in order to accommodate the user's entry.
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.textColor == UIColor.lightGray {
//            textView.text = nil
//            textView.textColor = UIColor.black
//        }
//    }
//
//    //When the user finishes editing the text view and it's resigned as the first responder, if the text view is empty, reset
//    //its placeholder by re-adding the placeholder text and setting its color to light gray.
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = "Need to brainstorm? Use this field to do so.  Nothing you type here will be submitted as your answer..."
//            textView.textColor = UIColor.lightGray
//        }
//    }
//}
//
//extension QType1ViewController: UITextFieldDelegate {
//
//    //This function is called when the user presses the return button
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        //When user presses the return button, switch the first responder status to the next field.
//        switch textField {
//        case firstTextField:
//            secondTextField.becomeFirstResponder()
//        case secondTextField:
//            thirdTextField.becomeFirstResponder()
//        case thirdTextField:
//            thirdTextField.becomeFirstResponder()
//        default:
//            thirdTextField.becomeFirstResponder()
//        }
//
//        return true
//    }
//}
