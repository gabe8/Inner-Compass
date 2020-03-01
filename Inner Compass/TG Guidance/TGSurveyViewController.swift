//
//  TGViewController.swift
//  Inner Compass
//
//  Created by Todd Goldenbaum on 2/29/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class TGSurveyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressBar.progress = 0.15
        progressLabel.text = "3/15"
    }
}

extension TGSurveyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! TGQuestionCell
            cell.questionLabel.text = "1. How are you feeling?"
            return cell
        case 1, 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! TGDescriptionCell
            cell.descriptionLabel.text = indexPath.row == 1 ? "First paragraph of descritption..." : "Second paragraph..."
            return cell
        case 3, 4, 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! TGAnswerCell
            cell.answerCellDelegate = self
            cell.questionNumber = indexPath.row - 2
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "submitButtonCell", for: indexPath) as! TGSubmitButtonCell
            cell.submitButtonCellDelegate = self
            return cell
        default: break
        }
        return UITableViewCell()
    }
}

extension TGSurveyViewController: TGAnswerCellDelegate {
    func answer(_ answerCount: Int, changedTo newString: String) {
        // The user just changed the answer to question answerCount to have the new value newString.  This would be a
        // great time to jot that down in UserDefaults so we will not lose it if the app is interrupted.
        print("answer #\(answerCount) was just changed to \(newString)")
    }
}

extension TGSurveyViewController: TGSubmitButtonCellDelegate {
    func submitButtonPressed() {
        // Iterate to the next question or take them elsewhere?
        print("Submit button pressed")
    }
}
