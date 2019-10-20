//
//  HostingController.swift
//  SwoleApp WatchKit Extension
//
//  Created by Larry Tseng on 10/20/19.
//  Copyright © 2019 Emmie Ohnuki. All rights reserved.
//

import Foundation
import SwiftUI

class HostingController: WKHostingController<MainView> {
    override var body: MainView {
        // Return the view structure that the hosting controller displays.
        return MainView()
    }
}
