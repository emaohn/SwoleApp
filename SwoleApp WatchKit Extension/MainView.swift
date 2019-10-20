//
//  MainView.swift
//  SwoleApp WatchKit Extension
//
//  Created by Larry Tseng on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var sensor = SensorModel()
    
    var body: some View {
        NavigationLink(destination: ArrowView(sensor: self.sensor)) {
            Text("Start")
        }.navigationBarTitle("Curl")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
