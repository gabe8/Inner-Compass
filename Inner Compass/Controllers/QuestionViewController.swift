//
//  Q1ViewController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 2/15/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//
//  Here is where I put class-specific comments.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressBarLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // Good place for comment re: this group of properties
    var contentModel: ContentModelController?
    var dataModel: UserDataModelController?
    var questionNumber = 0
    let defaults = UserDefaults.standard
    
    // Good place for a function-specific comment
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressBar.progress = 0.1
        progressBarLabel.text = "1 out of 10 questions completed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        contentModel = ContentModelController(questionNumber: questionNumber)
        dataModel = UserDataModelController()
    }
}

extension QuestionViewController: UITableViewDataSource {
    // This method sets the total numer of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    // This method will be called however many times is indicated by the numer of rows above and sets the cell.  It creates
    // the content for the cell as well unless indicated in the custom class file
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! Q1QuestionCell
            cell.q1QuestionLabel.text = contentModel?.getQuestionMain()
            //cell.textLabel?.text = "Hello can you see me 1?"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! Q1DescriptionCell
            cell.q1DescriptionLabel.text = contentModel?.getQuestionDescription()
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionsCell", for: indexPath) as! Q1InstructionsCell
            cell.q1InstructionsLabel.text = contentModel?.getQuestionInstructions()
            return cell
        case 3, 4, 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! Q1TextFieldCell
            cell.textFieldCellDelegate = self
            cell.textFieldNumber = indexPath.row - 2
            //let indexRowToKey = indexPath.row - 3
            //cell.answerTextField.text = q1AnswerArray[questionCount][indexRowToKey]
            //print(cell.answerTextField.text)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! Q1ButtonCell
            cell.q1ButtonCellDelegate = self
            return cell
        default: break
        }
        return UITableViewCell()
        // This is where we would populate the cells with the correct data for the current question.
        // This will require subclassing UITableViewCell for each of our prototypes, in order to have
        // IBOutlets to the labels or textfields within the cell, depending on which prototype it is.
    }
    
}
extension QuestionViewController: Q1TextFieldCellDelegate {
    func getAnswer(number: Int) -> String? {
        // Change the value of the dictionary at current questionCount location to the text entered by user.
        if let existingAnswer = dataModel?.existingAnswerFromUserDefaults(questionNumber: questionNumber, answerNumber: number) {
            return existingAnswer
        }
        return nil
    }

    func saveAnswer(_ answerCount: Int, changedTo newString: String) {
        // The user just changed the answer to question answerCount to have the new value newString.  This would be a
        // great time to jot that down in UserDefaults so we will not lose it if the app is interrupted.
        print("answer #\(answerCount) was just changed to \(newString)")
        
        print("Here is the array after it was retrived from UserDefaults and decoded")
    }
}

extension QuestionViewController: Q1SubmitButtonCellDelegate {
    func q1ButtonPressed() {
        print("Submit button pressed")
        
        // Here we instance the storyboard, so we can instantiate our view controller with all the trimmings
        // included in the storybaord's layout/UI features.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let newViewController = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            newViewController.questionNumber = questionNumber + 1
            navigationController?.pushViewController(newViewController, animated: true)
        }
    }
}

//extension Q1ViewController: UITextFieldDelegate {
//
//      //This function is called when the user presses the return button
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
////            let index = IndexPath(row: textField.tag, section: 0)
////            let cell: Q1TextFieldCell = self.tableView.cellForRow(at: index) as! Q1TextFieldCell
//
//            //When user presses the return button, switch the first responder status to the next field.
//            switch textField.tag {
//            case 3:
//                textField.viewWithTag(4)?.becomeFirstResponder()
//            case 4:
//                textField.viewWithTag(5)?.becomeFirstResponder()
//            case 5:
//                textField.viewWithTag(5)?.resignFirstResponder()
//            default:
//                textField.viewWithTag(5)?.resignFirstResponder()
//            }
//
//
//
//
//
//    //        switch textField {
//    //        case firstTextField:
//    //            secondTextField.becomeFirstResponder()
//    //        case secondTextField:
//    //            thirdTextField.becomeFirstResponder()
//    //        case thirdTextField:
//    //            thirdTextField.becomeFirstResponder()
//    //        default:
//    //            thirdTextField.becomeFirstResponder()
//    //        }
//
//            return true
//
//    }
//
//             //!!!!!!!!!some people have ? after Field - ask Todd about this
//            cell.answerTextField?.tag = indexPath.row
//
//            switch cell.answerTextField?.tag {
//                case 3:
//                cell.answerTextField.placeholder = "Your first thing..."
//                case 4:
//                cell.answerTextField.placeholder = "Your second thing..."
//                case 5:
//                cell.answerTextField.placeholder = "Your third thing..."
//                default:
//                 cell.answerTextField.placeholder = "Enter your answer here"
//            }
