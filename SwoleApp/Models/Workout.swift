//
//  Workout.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/19/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct Workout {
    var exerciseType: ExerciseType
}

enum ExerciseType: String {
    case Curl = "Curl"
    case BenchPress = "BenchPress"
    case Lunge = "Lunge"
    case PushUp = "PushUp"
}
