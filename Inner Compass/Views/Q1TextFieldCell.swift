//
//  q1TextFieldCell.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 2/20/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

protocol Q1TextFieldCellDelegate {
    func getAnswer(number: Int) -> String?
    func saveAnswer(_ answerCount: Int, changedTo newString: String)
}

class Q1TextFieldCell: UITableViewCell {
    @IBOutlet weak var answerTextField: UITextField!
    
    var textFieldNumber: Int?
    var textFieldCellDelegate: Q1TextFieldCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        answerTextField.delegate = self
        
        // If there is an existing answer in user defaults for this question/answer,
        // populate the text field with it
        if let answerNumber = textFieldNumber {
            if let existingAnswer = textFieldCellDelegate?.getAnswer(number: answerNumber) {
                answerTextField.text = existingAnswer
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension Q1TextFieldCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldCellDelegate?.saveAnswer(textFieldNumber!, changedTo: textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}

