//
//  BackgroundTimer.swift
//  ThermalMonitor
//
//  Created by A on 2020/06/06.
//  Copyright © 2020 Edfood. All rights reserved.
//

import Cocoa
import Foundation

class BackgroundTimer : ObservableObject {
    
    @Published var cpuTemperature = 0
    var count = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.count += 1
            //self.count値をコンソールへ出力
            
            print(self.count)
        })
    }
    
    func updateCPUTemp() {
        DispatchQueue.main.sync {
            let temp = SMCObjC.calculateTemp()
            print("I got \(temp) in swift")
        }
    }
}
