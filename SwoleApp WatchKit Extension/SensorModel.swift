//
//  SensorCollection.swift
//  FitnessAppWatch Extension
//
//  Created by Larry Tseng on 10/19/19.
//  Copyright © 2019 FitnessApp. All rights reserved.
//

import Foundation
import CoreMotion
import SwiftUI

class SensorModel: ObservableObject {
    
    final let interval: TimeInterval = 0.1;
    
    let manager: CMMotionManager = CMMotionManager()
    let accelQueue: OperationQueue = OperationQueue()
    
    var previousAccel: Double = 0;
    var previousVel: Double = 0;
    var previousDisp: Double = 0;
    
    var endStopper: Bool = false
    var innerRepCount: Int = 0
    
    @Published var totalDisplacement: String = ""
    @Published var flipped: Bool = false
    @Published var repCount: Int = 0
    @Published var isDeviating: Bool = false

    init() {
        accelQueue.name = "Accelerometer Queue"
        manager.accelerometerUpdateInterval = interval;
        manager.deviceMotionUpdateInterval = interval;
        
        manager.startAccelerometerUpdates(to: accelQueue, withHandler: handleAccelData)
        manager.startDeviceMotionUpdates()
    }
    
    func handleAccelData(data: CMAccelerometerData?, error: Error?) {
        guard let data = data else {
            return;
        }
        
        guard let deviceMotion = manager.deviceMotion else {
            return;
        }
        
        let thetaY = deviceMotion.attitude.pitch
        let normalZ = (data.acceleration.z - deviceMotion.gravity.z) * cos(thetaY)
//        let stringZ = String(format: "%.2f", normalZ)
        
        let thetaX = deviceMotion.attitude.roll
        let normalY = (data.acceleration.y - deviceMotion.gravity.y) * cos(thetaX)
//        let stringY = String(format: "%.2f", normalY)
        
        let thetaZ = deviceMotion.attitude.yaw
        let normalX = (data.acceleration.x - deviceMotion.gravity.x) * cos(thetaZ)
//        let stringX = String(format: "%.2f", normalX)
        
        if (-1.05 ..< -0.8).contains(deviceMotion.gravity.x)  {
            if (!endStopper) {
                print("END")
                innerRepCount += 1
            }
            endStopper = true
        } else if (0.6 ..< 0.9).contains(deviceMotion.gravity.x) {
            print("START")
            endStopper = false
        }
        
        DispatchQueue.main.async {
//            self.totalDisplacement = String(format: "%.4f", self.processPositionalData(normalZ))
//            print(String(format: "%.4f", data.acceleration.z - deviceMotion.gravity.z))

            if self.repCount == 3 {
                self.isDeviating = true
                self.flipped = true // Point Left
            } else if self.repCount == 4 {
                self.isDeviating = false
                self.flipped = false
            } else if self.repCount == 5 {
                self.isDeviating = true
                self.flipped = true
            } else if self.repCount == 6 {
                self.isDeviating = false
                self.flipped = false
            }

            // 1st rep = normal
            // 2nd rep = normal
            // 3rd rep = move right
            // 4th rep = normal
            // 5th rep = move left
            
            self.repCount = self.innerRepCount
            print("Rep: \(self.innerRepCount), dM: \(deviceMotion.gravity.x)")
        }
        
//        print("x: \(stringX), y: \(stringY), z: \(stringZ)")


    }
    
    func processPositionalData(_ axisAccel: Double) -> Double {
        // 1 – Change Units
        let metricAccel = axisAccel * -9.8
        
        // 2 – Trapezoidal Area
        let velocity = ((metricAccel - previousAccel) / 2.0) * interval
        previousAccel = metricAccel
        
        // 3 – Velocity Kinematics
        let totalVelocity = velocity + previousVel
        previousVel = totalVelocity
        
        // 4 – Displacement Kinematics
        let deltaDisplacement = totalVelocity * interval
        
        // 5 – Final Displacement
        let finalDisplacement = previousDisp + deltaDisplacement
        previousDisp = finalDisplacement
        
        print("axisAccel: \(axisAccel), metricAccel: \(metricAccel), vel: \(velocity), totalVel: \(totalVelocity), ∆x: \(deltaDisplacement), finalX: \(finalDisplacement)")
        
        return finalDisplacement
    }
    
}
