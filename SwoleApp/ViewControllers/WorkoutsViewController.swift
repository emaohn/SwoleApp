//
//  WorkoutsViewController.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var workouts: [Workout]?
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
    }
    
    func setup() {
        addWorkoutButton.layer.cornerRadius = 20
    }
    
    func reloadData() {
        workoutsTableView.reloadData()
    }
    
    @IBAction func addWorkoutButton(_ sender: Any) {
        self.performSegue(withIdentifier: "addWorkout", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? EditWorkout
        switch segue.identifier {
        case "addWorkout":
            destination?.exercises = [Exercise]()
        case "editWorkout":
            destination?.workout = selectedWorkout
            destination?.nameTextField.text = selectedWorkout?.title
            destination?.exercises = selectedWorkout?.exercises
        default: return
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWorkout = workouts?[indexPath.row]
        self.performSegue(withIdentifier: "editWorkout", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts?.count ?? 0
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workoutsTableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath) as! WorkoutTableViewCell
        cell.titleLabel.text = workouts?[indexPath.row].title
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
