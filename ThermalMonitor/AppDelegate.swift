//
//  AppDelegate.swift
//  ThermalMonitor
//
//  Created by A on 2020/06/05.
//  Copyright © 2020 Edfood. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: -1)
        statusBarItem.button?.title = "Test"

        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        statusBarItem.menu = statusBarMenu

        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.quit(_:)),
            keyEquivalent: "")

    }

    @objc func quit(_ sender: Any){
        NSApplication.shared.terminate(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}
