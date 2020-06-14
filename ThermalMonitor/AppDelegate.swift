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
//

import Cocoa
//import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    let fontName = "monospacedDigitSystemFont"
    let defaultTitle = "CPU: 0.00℃"
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: -1)
        statusBarItem.button?.title = defaultTitle
        statusBarItem.button?.font = NSFont(name: fontName, size: 10)

        let statusBarMenu = NSMenu(title: "ThermalMonitor Status Bar Menu")
        statusBarItem.menu = statusBarMenu

        statusBarMenu.addItem(
            withTitle: "Quit ThermalMonitor",
            action: #selector(AppDelegate.quit(_:)),
            keyEquivalent: "")
            
        let _ = BackgroundTimer()  // update CPU temperature of status bar
            
        }

    @objc func quit(_ sender: Any){
        NSApplication.shared.terminate(self)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}
