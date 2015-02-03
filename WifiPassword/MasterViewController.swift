//
//  MasterViewController.swift
//  WifiPassword
//
//  Created by Isaac Rosenberg on 10/22/14.
//  Copyright (c) 2014 irosenb. All rights reserved.
//

import Cocoa
import CoreWLAN

class MasterViewController: NSViewController {
    
    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var password: NSTextField!
    
    @IBOutlet weak var wifi: NSTextField!
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem: NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    var wifiName : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "password"
        
        menuItem.title = "Show"
        menuItem.action = Selector("setWindowVisible:")
        menuItem.keyEquivalent = "p"
        menu.addItem(menuItem)
    }
    
    func getPassword() {
        if (wifiName != CWInterface(interfaceName: nil).ssid()) {
            wifiName = CWInterface(interfaceName: nil).ssid()
            
            wifi.stringValue = wifiName
            password.stringValue = SSKeychain.passwordForService("AirPort", account: wifiName)
        }
    }
    
}
