//
//  ArrowView.swift
//  SwoleApp WatchKit Extension
//
//  Created by Larry Tseng on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import SwiftUI

struct ArrowView: View {
    
    @ObservedObject var sensor: SensorModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Rep Count: \(sensor.repCount)")
                Spacer()
                Text("Curl")
            }
            // Down = left
            // Up = right (-.5 to
            if sensor.isDeviating {
                Image(systemName: sensor.flipped ? "arrow.down" : "arrow.up").resizable()
            } else {
                Spacer()
            }
        }
    }
}

//struct ArrowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArrowView()
//    }
//}
