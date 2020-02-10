//
//  ToddViewController.swift
//  Inner Compass
//
//  Created by Todd Goldenbaum on 2/9/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class ToddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressBarLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressBar.progress = 0.15
        progressBarLabel.text = "3/15"
    }
    
    // UITableViewDatasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Derive the cell type we need
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionCellTableViewCell
            cell.questionLabel.text = "1. How are you feeling?"
            return cell
        case 1, 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath)
            return cell
        case 3, 4, 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "answerFieldCell", for: indexPath)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "submitButtonCell", for: indexPath)
            return cell
        default: break
        }
        

        // This is where we would populate the cells with the correct data for the current question.
        // This will require subclassing UITableViewCell for each of our prototypes, in order to have
        // IBOutlets to the labels or textfields within the cell, depending on which prototype it is.

        return UITableViewCell()
    }
}
