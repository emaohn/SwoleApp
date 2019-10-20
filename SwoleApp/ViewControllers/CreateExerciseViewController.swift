//
//  CreateExerciseTableViewController.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import UIKit

class CreateExerciseViewController: UIViewController {
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    
    var reps = 0
    var sets = 0
    
    @IBOutlet weak var exercisePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repLabel.text = "\(reps) reps"
        stepLabel.text = "\(sets) sets"
       
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleNewExercise"), object: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleNewExercise"), object: nil)
        let exercise = Exercise(type: .Curl, numReps: reps, numSets: sets)
        Variables.exercises.append(exercise)
    }
    @IBAction func repStepperToggled(_ sender: UIStepper) {
        repLabel.text = "\(Int(sender.value)) reps"
        reps = Int(sender.value)
        
    }
    @IBAction func stepStepperToggled(_ sender: UIStepper) {
        stepLabel.text = "\(Int(sender.value)) sets"
        sets = Int(sender.value)
    }
}
