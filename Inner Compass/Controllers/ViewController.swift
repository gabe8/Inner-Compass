//
//  ViewController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 1/27/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 25
    }
    
    //Make the navigation controller hide the top nav bar for this root controller, but make it appear for all other screens going forward:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func startHereButtonPressed(_ sender: UIButton) {
    }
    
    
}

