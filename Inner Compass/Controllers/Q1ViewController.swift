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
        return 6
    }
    
    // This method will be called however many times is indicated by the numer of rows above and sets the cell.  It creates
    // the content for the cell as well unless indicated in the custom class file
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

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
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionsField", for: indexPath) as! Q1InstructionsCell
            cell.q1InstructionsLabel.text = questionBrain.getQuestionInstructions()
            return cell
        case 3, 4, 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerField", for: indexPath) as! Q1TextFieldCell

             //!!!!!!!!!some people have ? after Field - ask Todd about this
            cell.answerTextField?.tag = indexPath.row
            
            switch cell.answerTextField?.tag {
                case 3:
                cell.answerTextField.placeholder = "Your first thing..."
                case 4:
                cell.answerTextField.placeholder = "Your second thing..."
                case 5:
                cell.answerTextField.placeholder = "Your third thing..."
                default:
                 cell.answerTextField.placeholder = "Enter your answer here"
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionField", for: indexPath)
            cell.textLabel?.text = "Hello can you see me?"
            return cell

        }
//                case 3,4,5:
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "Test2", for: indexPath) as! Q1DescriptionCell
//                    cell.q1DescriptionLabel.text = questionBrain.getQuestionDescription()
        
        
        // This is where we would populate the cells with the correct data for the current question.
              // This will require subclassing UITableViewCell for each of our prototypes, in order to have
              // IBOutlets to the labels or textfields within the cell, depending on which prototype it is.
              
    }
    
    
    
    
}





extension Q1ViewController: UITextFieldDelegate {

      //This function is called when the user presses the return button
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {

//            let index = IndexPath(row: textField.tag, section: 0)
//            let cell: Q1TextFieldCell = self.tableView.cellForRow(at: index) as! Q1TextFieldCell
            
            //When user presses the return button, switch the first responder status to the next field.
            switch textField.tag {
            case 3:
                textField.viewWithTag(4)?.becomeFirstResponder()
            case 4:
                textField.viewWithTag(5)?.becomeFirstResponder()
            case 5:
                textField.viewWithTag(5)?.resignFirstResponder()
            default:
                textField.viewWithTag(5)?.resignFirstResponder()
            }
 




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

            return true

    }

}
