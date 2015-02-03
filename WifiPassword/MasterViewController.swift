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
    
//    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var password: NSTextField!
    
    @IBOutlet weak var wifiField: NSTextField!
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem: NSStatusItem = NSStatusItem()
    var menuItem : NSMenuItem = NSMenuItem()
    var wifiMenu = NSMenu()
    var wifi: Wifi!

    override func windowDidLoad() {
        super.windowDidLoad()
        println("Hello world")
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "password"
        
        menuItem.title = "Show"
        menuItem.action = Selector("showPassword:")
        menuItem.keyEquivalent = "p"
        wifiMenu.addItem(menuItem)
    }
    
    func showPassword(sender: AnyObject) {
        if (wifi.network != Wifi().network) {
            getPassword()
        }
        window!.center()
        self.window!.orderFrontRegardless()
        self.window!.orderedIndex = 0
    }
    
    func getPassword() {
        wifi = Wifi()
        
        wifiField.stringValue = wifi.network
        password.stringValue = wifi.password
    }
    
}
