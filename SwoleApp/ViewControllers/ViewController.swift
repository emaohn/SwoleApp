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
    var users: [Person] = [Person(user_id: "0", username: "emmie", workoutHistory: [Workout(exerciseType: .BenchPress), Workout(exerciseType: .Curl)]), Person(user_id: "1", username: "seb", workoutHistory: [Workout(exerciseType: .BenchPress), Workout(exerciseType: .Curl)]), Person(user_id: "2", username: "larry", workoutHistory: [Workout(exerciseType: .BenchPress), Workout(exerciseType: .Curl)]), Person(user_id: "3", username: "Anthony", workoutHistory: [Workout(exerciseType: .BenchPress), Workout(exerciseType: .Curl)])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        statsView.layer.cornerRadius = 15
        startWorkoutButton.layer.cornerRadius = 100
    }

    @IBAction func startWorkoutButtonPressed(_ sender: Any) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users[0].workoutHistory.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "historyTableViewCell", for: indexPath) as! HistoryTableViewCell
        let workout = users[0].workoutHistory[indexPath.row]
        switch workout.exerciseType {
        case .BenchPress: cell.label.text = "bench press"
        case .Curl: cell.label.text = "bench press"
        case .Lunge: cell.label.text = "bench press"
        case .PushUp: cell.label.text = "bench press"
        default: return cell
        }
        return cell;
    }
}



