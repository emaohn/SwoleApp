//
//  EditWorkoutTableViewController.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import UIKit

class EditWorkout: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var workout: Workout?
    var exercises: [Exercise]?

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var exerciseTableView: UITableView!
    @IBOutlet weak var addExerciseButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func doneButtonPressed(_ sender: Any) {
        if workout != nil {
            
        } else {
            guard let exercises = exercises else {return}
            guard let name = nameTextField.text else {return}
            workout = Workout(title: name, exercises: exercises)
        }
    }
    
    @IBAction func addExerciseButtonPressed(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = exerciseTableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseTableViewCell
        guard let exercises = exercises else {return cell}
        let exercise = exercises[indexPath.row]
        cell.typeLabel.text = exercise.type.rawValue
        cell.routineLabel.text = "\(exercise.numSets) sets, \(exercise.numReps) reps"
        return cell
    }
}
