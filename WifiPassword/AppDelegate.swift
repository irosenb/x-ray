//
//  AppDelegate.swift
//  WifiPassword
//
//  Created by Isaac Rosenberg on 10/21/14.
//  Copyright (c) 2014 irosenb. All rights reserved.
//

import Cocoa
import CoreWLAN

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var password: NSTextField!
    
    @IBOutlet weak var wifi: NSTextField!
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem: NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    var wifiName : String!
    var controller = MasterViewController(windowNibName: "MasterViewController")

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        window.styleMask = NSBorderlessWindowMask
        controller.showWindow(nil)
    }
    
    override func awakeFromNib() {
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "password"

        menuItem.title = "Show"
        menuItem.action = Selector("openWifiWindow:")
        menuItem.keyEquivalent = "p"
        menu.addItem(menuItem)
    }
    
    func openWifiWindow(sender: AnyObject) {
        controller.showPassword(self)
    }
    
    func setWindowVisible(sender: AnyObject) {
        if (wifiName != CWInterface(interfaceName: nil).ssid()) {
            wifiName = CWInterface(interfaceName: nil).ssid()
            
            wifi.stringValue = wifiName
            password.stringValue = SSKeychain.passwordForService("AirPort", account: wifiName)
        }
        window.center()
        self.window!.orderFrontRegardless()
        self.window.orderedIndex = 0
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

