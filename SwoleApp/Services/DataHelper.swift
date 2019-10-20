//
//  DataHelper.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct DataHelper {
    
    static func modifyWorkout(workouts: [Workout]) {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: workouts, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: "workouts")
        } catch {
            
        }
    }
    
    static func addPastWorkout(workout: PastWorkout) {
        
//        let decoded  = UserDefaults.standard.object(forKey: "workoutHistory") as! Data
//        var history = NSKeyedUnarchiver.un as! [PastWorkout]
        
        var history = UserDefaults.standard.value(forKey: "workoutHistory") as? [PastWorkout]
        history?.append(workout)
        
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: history , requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: "workoutHistory")
        } catch {
            
        }
    }
    
    static func retrieveWorkouts() -> [Workout] {
        return UserDefaults.standard.value(forKey: "workouts") as! [Workout]
    }
    
    static func retriveWorkoutHistory() -> [PastWorkout] {
        return UserDefaults.standard.value(forKey: "workoutHistory") as! [PastWorkout]
    }
}
