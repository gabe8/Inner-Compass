//
//  Q1ButtonCell.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 3/6/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

protocol Q1SubmitButtonCellDelegate {
    func q1ButtonPressed()
}

class Q1ButtonCell: UITableViewCell {
    var q1ButtonCellDelegate: Q1SubmitButtonCellDelegate?
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func q1ButtonPressed(_ sender: UIButton) {
        q1ButtonCellDelegate?.q1ButtonPressed()
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nextButton.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
