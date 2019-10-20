//
//  DataHelper.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct DataHelper {
    
    func modifyWorkout(workouts: [Workout]) {
        UserDefaults.standard.set(workouts, forKey: "workouts")
    }
    
    func addPastWorkout(workout: PastWorkout) {
        var history = UserDefaults.standard.value(forKey: "workoutHistory") as? [PastWorkout]
        history?.append(workout)
        UserDefaults.standard.set(history, forKey: "workoutHistory")
    }
    
    func retrieveWorkouts() -> [Workout] {
        return UserDefaults.standard.value(forKey: "workouts") as! [Workout]
    }
    
    func retriveWorkoutHistory() -> [PastWorkout] {
        return UserDefaults.standard.value(forKey: "workoutHistory") as! [PastWorkout]
    }
}
