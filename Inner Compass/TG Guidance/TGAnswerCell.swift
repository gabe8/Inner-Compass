//
//  TGAnswerCell.swift
//  Inner Compass
//
//  Created by Todd Goldenbaum on 2/29/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

protocol TGAnswerCellDelegate {
    func answer(_ answerCount: Int, changedTo newString: String)
}

class TGAnswerCell: UITableViewCell {
    var questionNumber: Int?
    @IBOutlet weak var textField: UITextField!
    var answerCellDelegate: TGAnswerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension TGAnswerCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        answerCellDelegate?.answer(questionNumber!, changedTo: textField.text!)
    }
}
