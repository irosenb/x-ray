//
//  MasterViewController.swift
//  WifiPassword
//
//  Created by Isaac Rosenberg on 10/22/14.
//  Copyright (c) 2014 irosenb. All rights reserved.
//

import Cocoa
import CoreWLAN

class MasterViewController: NSWindowController {

    @IBOutlet weak var password: NSTextField!
    
    @IBOutlet var wifiWindow: NSWindow!
    @IBOutlet weak var wifiField: NSTextField!
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem: NSStatusItem = NSStatusItem()
    var menuItem : NSMenuItem = NSMenuItem()
    var wifiMenu = NSMenu()
    var wifi: Wifi?

    override func windowDidLoad() {
        super.windowDidLoad()
        println("Hello world")
        wifiWindow.styleMask = NSBorderlessWindowMask
    }
    
    func showPassword(sender: AnyObject) {
        if (wifi?.network != Wifi().network) {
            setPassword()
        }
        wifiWindow.center()
        wifiWindow.becomeKeyWindow()
        wifiWindow.makeKeyAndOrderFront(wifiWindow)
    }
    
    func setPassword() {
        wifi = Wifi()
        
        wifiField.stringValue = wifi!.network
        password.stringValue = wifi!.password
    }
    
}
