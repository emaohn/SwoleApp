//
//  CreateExerciseTableViewController.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import UIKit

class CreateExerciseViewController: UIViewController {

    @IBOutlet weak var exercisePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleNewExercise"), object: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleNewExercise"), object: nil)
    }
    @IBAction func repStepperToggled(_ sender: Any) {
    }
    @IBAction func stepStepperToggled(_ sender: Any) {
    }
}
