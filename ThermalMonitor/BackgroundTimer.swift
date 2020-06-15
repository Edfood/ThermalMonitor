//
//  BackgroundTimer.swift
//  ThermalMonitor
//
//  Created by A on 2020/06/06.
//  Copyright © 2020 Edfood. All rights reserved.
//
//  This file is part of Foobar.
//
//  Foobar is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Foobar is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Foobar.  If not, see <http://www.gnu.org/licenses/>.



import Cocoa
import Foundation


class BackgroundTimer {
    
    var handler: CPUTempHandler
    var appDelegate: AppDelegate {
        return NSApplication.shared.delegate as! AppDelegate
    }
    
    init() {
        
        handler = CPUTempHandler()
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { (timer) in
            self.handler.updateCPUTemp()
            let temperature = self.handler.cpuTemperature
            let strTemp = String(format: "%.1f", temperature)
            self.appDelegate.statusBarItem.button?.title = "CPU: \(strTemp)℃"
            
            print("\(temperature)")
                
        })
        
    }
}
