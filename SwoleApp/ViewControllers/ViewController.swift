//
//  ViewController.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/19/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var startWorkoutButton: UIButton!

    var workoutHistory = Variables.workoutHistory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    func setup() {
        statsView.layer.cornerRadius = 15
        historyTableView.layer.cornerRadius = 15
        startWorkoutButton.layer.cornerRadius = 20
    }
    
    func reloadData() {
        workoutHistory = Variables.workoutHistory
        historyTableView.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case "openSettings":
//            let destination = segue.destination as? SettingsViewController
//        case "startWorkout":
//            let destination = segue.destination as? WorkoutsViewController
//            destination?.workouts =
//        default: return
//        }
//    }
    
    @IBAction func startWorkoutButtonPressed(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let history = workoutHistory
        return workoutHistory.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        }
        return 80
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            return historyTableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        }
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "historyTableViewCell", for: indexPath) as! HistoryTableViewCell
        let workout = workoutHistory[indexPath.row - 1]
        cell.dateLabel.text = workout.dateToStrig()
        var s = ""
        for exercise in workout.workout.exercises {
            s += "\(exercise.type.rawValue), "
        }
        cell.workoutListLabel.text = s
        
        return cell;
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
}



