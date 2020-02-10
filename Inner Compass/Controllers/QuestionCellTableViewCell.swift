//
//  QuestionCellTableViewCell.swift
//  Inner Compass
//
//  Created by Todd Goldenbaum on 2/9/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class QuestionCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
