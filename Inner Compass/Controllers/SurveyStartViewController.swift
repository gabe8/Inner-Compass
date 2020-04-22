//
//  SurveyStartViewController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 1/28/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class SurveyStartViewController: UIViewController {

    @IBOutlet weak var beginSurveyButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      // Set the corner radius for the Begin Survey button
        beginSurveyButton.layer.cornerRadius = 25
        
    }
}
