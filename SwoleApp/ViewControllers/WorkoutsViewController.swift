//
//  WorkoutsViewController.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var workouts = [Workout(title: "Larry's Workout", exercises: [Exercise(type: .Curl, numReps: 6, numSets: 1), Exercise(type: .Curl, numReps: 5, numSets: 2)])]
    var selectedWorkout: Workout?
    
    @IBOutlet weak var workoutsTableView: UITableView!
    @IBOutlet weak var addWorkoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedWorkout = nil
        //reloadData()
        setup()
    }
    
    func setup() {
        addWorkoutButton.layer.cornerRadius = 20
    }
    
    func reloadData() {
//        workouts = Variables.workouts
//        workoutsTableView.reloadData()
    }
    
    @IBAction func addWorkoutButton(_ sender: Any) {
        self.performSegue(withIdentifier: "addWorkout", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? EditWorkout
        switch segue.identifier {
        case "addWorkout":
            destination?.exercises = [Exercise]()
       
        default: return
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWorkout = workouts[indexPath.row]
        self.performSegue(withIdentifier: "editWorkout", sender: nil)
        let workout = workouts[indexPath.row]
        let pastWorkout = PastWorkout(workout: workout, date: Date())
//        workoutHistory.append(pastWorkout)
//        Variables.selectedWorkout = workout
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workoutsTableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath) as! WorkoutTableViewCell
        cell.titleLabel.text = workouts[indexPath.row].title
        return cell
    }

}
