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
    var exercises = [Exercise(type: .Curl, numReps: 6, numSets: 9), Exercise(type: .Curl, numReps: 23, numSets: 1), Exercise(type: .Curl, numReps: 7, numSets: 12)]
    var types = ["Curls"]

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var exerciseTableView: UITableView!

    @IBOutlet weak var addExerciseButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var newExerciseContainerView: UIView!
    @IBOutlet weak var editExerciseContainerView: UIView!
    @IBOutlet weak var newExerciseTopContraint: NSLayoutConstraint!
    @IBOutlet weak var editExerciseTopConstraint: NSLayoutConstraint!
    
    var newExerciseOpen = false
    var editExerciseOpen = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
        NotificationCenter.default.addObserver(self, selector: #selector(toggleNewExercise), name: NSNotification.Name("ToggleNewExercise"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleNewExercise), name: NSNotification.Name("ToggleEditExercise"), object: nil)
        nameTextField.text = "Larry's Workout"
        exercises = [Exercise(type: .Curl, numReps: 6, numSets: 1), Exercise(type: .Curl, numReps: 5, numSets: 2)]
    }

    // MARK: - Table view data source
    func setup() {
        newExerciseTopContraint.constant = 800
        editExerciseTopConstraint.constant = 800
        
        editExerciseContainerView.layer.cornerRadius = 15
        newExerciseContainerView.layer.cornerRadius = 15
        
        doneButton.layer.cornerRadius = 20
        addExerciseButton.layer.cornerRadius = 20
        
    }
    
    func reloadData() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        
        let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(self.navigationBarTap))
        hideKeyboard.numberOfTapsRequired = 1
        navigationController?.navigationBar.addGestureRecognizer(hideKeyboard)
    }
    
    @objc func navigationBarTap(_ recognizer: UIGestureRecognizer) {
        view.endEditing(true)
        // OR  USE  yourSearchBarName.endEditing(true)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {

        guard let name = nameTextField.text else {return}
        workout = Workout(title: name, exercises: exercises)
        Variables.workouts.append(workout!)
//        if workout != nil {
//            var workouts = Variables.workouts
//            for i in 0...workouts.count - 1 {
//                if (workouts[i].title == workout?.title) {
//                    workouts[i].title = nameTextField.text ?? ""
//                    workouts[i].exercises = exercises ?? [Exercise]()
//                }
//            }
//            DataHelper.modifyWorkout(workouts: workouts)
//        } else {
//            guard let exercises = exercises else {return}
//            guard let name = nameTextField.text else {return}
//            workout = Workout(title: name, exercises: exercises)
//            var workouts = DataHelper.retrieveWorkouts()
//            workouts.append(workout!)
//            DataHelper.modifyWorkout(workouts: workouts)
//        }
    }
    
    @IBAction func addExerciseButtonPressed(_ sender: Any) {
        toggleNewExercise()
    }
    
    @objc func toggleNewExercise() {
        if newExerciseOpen {
            newExerciseTopContraint.constant = 800
            newExerciseOpen = false
        } else {
            newExerciseTopContraint.constant = 50
            newExerciseOpen = true
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        reloadData()
    }
    
    @objc func toggleEditExercise() {
           if editExerciseOpen {
               editExerciseTopConstraint.constant = 800
               editExerciseOpen = false
           } else {
               editExerciseTopConstraint.constant = 50
               editExerciseOpen = true
           }
           UIView.animate(withDuration: 0.3) {
               self.view.layoutIfNeeded()
           }
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = exerciseTableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseTableViewCell
 
        let exercise = exercises[indexPath.row]
        cell.typeLabel.text = exercise.type.rawValue
        cell.routineLabel.text = "\(exercise.numSets) sets, \(exercise.numReps) reps"
        return cell
    }
}
