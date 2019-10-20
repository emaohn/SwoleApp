//
//  PastWorkout.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import Foundation

class PastWorkout {
    let workout: Workout
    let date: Date
    
    init(workout: Workout, date: Date) {
        self.workout = workout
        self.date = date
    }
    
    func dateToStrig() -> String {
        return "10/19/19"
    }
}

