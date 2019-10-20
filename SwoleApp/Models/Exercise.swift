//
//  Exercise.swift
//  SwoleApp
//
//  Created by Emmie Ohnuki on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct Exercise {
    var type: ExerciseType
    var numReps: Int
    var numSets: Int
}

enum ExerciseType: String {
    case Curl = "Curl"
    case BenchPress = "BenchPress"
    case Lunge = "Lunge"
    case PushUp = "PushUp"
}
