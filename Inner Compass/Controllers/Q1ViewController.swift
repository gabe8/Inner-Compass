//
//  Q1ViewController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 2/15/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class Q1ViewController: UIViewController {
    
    @IBOutlet weak var q1ProgressBar: UIProgressView!
    @IBOutlet weak var q1ProgressBarLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var contentModel: ContentModelController?
    var dataModel: UserDataModelController
    var q1AnswerArray = [[Int:String]]()
    var q1QuestionCount = 0
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        q1ProgressBar.progress = 0.1
        q1ProgressBarLabel.text = "1 out of 10 questions completed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        contentModel = ContentModelController(questionNumber: q1QuestionCount)
        dataModel = UserDataModelController()
    }
}

extension Q1ViewController: UITableViewDataSource {
    
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
extension Q1ViewController: Q1TextFieldCellDelegate {
    func getAnswer(_ answerCount: Int, changedTo newString: String) {
        // The user just changed the answer to question answerCount to have the new value newString.  This would be a
        // great time to jot that down in UserDefaults so we will not lose it if the app is interrupted.
        print("answer #\(answerCount) was just changed to \(newString)")
        
        // Change the value of the dictionary at current questionCount location to the text entered by user.
        q1AnswerArray[q1QuestionCount].updateValue(newString, forKey: answerCount)
        
        // Test the array and make sure it's functioning correctly
        print("The question number we are on is \(q1QuestionCount) and the number of dictionaries in this array is \(q1AnswerArray.count)")
        
        //Here is a dump of the query before encoding it for UserDefaults
        dump(q1AnswerArray)
        
        // Save the q1 question type answer array into UserDefaults as a custom object, so encode first
        //        var encodedData: Any?
        //        do {
        //            encodedData = try NSKeyedArchiver.archivedData(withRootObject: q1AnswerArray, requiringSecureCoding: true)
        //
        //        } catch {
        //            print("Error when trying to archive the data with NSKeyedArchiver")
        //        }
        //
        //        defaults.set(encodedData, forKey: "q1TypeAnswersArray")
        //
        //        // Set a variable to the archived UserDefaults object
        //        let dataToDecode = defaults.object(forKey: "q1TypeAnswersArray")
        
        //        if let decodedAnswerArray = NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataToDecode as! Data)
        //        {
        //            print("It worked!")
        //        } else {
        //            print("It failed!")
        //        }
        
        dataModel.saveArrayIntoUserDefaults(arrayToSave:q1AnswerArray)
        
        print("Here is the array after it was retrived from UserDefaults and decoded")
        dump(q1AnswerArray)
        
    }
}

extension Q1ViewController: Q1SubmitButtonCellDelegate {
    func q1ButtonPressed() {
        // Increase the question count, so the data array q1AnswerArray knows to save the data to the appropriate dictionary
        q1QuestionCount += q1QuestionCount + 1
        
        // Load the next question in the survey onto the screen.
        contentModel?.nextQuestion()
        tableView.reloadData()
        print("Submit button pressed")
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
