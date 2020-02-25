//
//  ViewController.swift
//  BottomIndicator
//
//  Created by Karun Aggarwal on 07/02/20.
//  Copyright © 2020 Karun Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewIndicator: IndicatorView!
    @IBOutlet weak var labelCurrentIndex: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Storyboard"
        
        stepper.minimumValue = 1
        stepper.maximumValue = Double(viewIndicator.number.max - 1)
        stepper.value = Double(viewIndicator.number.min)
    }

    @IBAction func stepperAction(_ sender: UIStepper) {
        let val = Int(sender.value)
        labelCurrentIndex.text = "Current Index: " + val.description
        viewIndicator.number.min = val
        viewIndicator.updateView()
    }
    
}

