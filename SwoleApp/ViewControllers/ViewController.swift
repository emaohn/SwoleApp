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

    let user = Person(user_id: "0", username: "emmie", workoutHistory: [Workout(exerciseType: .BenchPress), Workout(exerciseType: .Curl), Workout(exerciseType: .PushUp)])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup();
    }
    
    func setup() {
        statsView.layer.cornerRadius = 15
        historyTableView.layer.cornerRadius = 15
        startWorkoutButton.layer.cornerRadius = 20
    }

    @IBAction func startWorkoutButtonPressed(_ sender: Any) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.workoutHistory.count + 1
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
        let workout = user.workoutHistory[indexPath.row - 1]
        cell.dateLabel.text = "Saturday, 10/19/19"
        cell.workoutListLabel.text = "Bench press, lunges, pushups"
        
        return cell;
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
}



