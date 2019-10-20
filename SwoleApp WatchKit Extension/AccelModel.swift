//
//  AccelModel.swift
//  SwoleApp WatchKit Extension
//
//  Created by Larry Tseng on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import Foundation
import SwiftUI

class AccelModel: ObservableObject {
    @Published var accel: Double
    
    init(_ accel: Double) {
        self.accel = accel
    }
}
