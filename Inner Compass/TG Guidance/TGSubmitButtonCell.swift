//
//  TGSubmitButtonCell.swift
//  Inner Compass
//
//  Created by Todd Goldenbaum on 2/29/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

protocol TGSubmitButtonCellDelegate {
    func submitButtonPressed()
}

class TGSubmitButtonCell: UITableViewCell {
    var submitButtonCellDelegate: TGSubmitButtonCellDelegate?

    @IBAction func submitButtonPressed(_ sender: Any) {
        submitButtonCellDelegate?.submitButtonPressed()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
