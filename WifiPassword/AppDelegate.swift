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
    var quitItem : NSMenuItem = NSMenuItem()
    var wifiName : String!
    var controller = MasterViewController(windowNibName: "MasterViewController")

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        controller.showWindow(nil)
    }
    
    override func awakeFromNib() {
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.image = NSImage(named: "xray")
        let image = NSImage(named: "xray")
        image?.size = NSMakeSize(20, 20)
        statusBarItem.button!.image = image

        menuItem.title = "Show Password"
        menuItem.action = Selector("openWifiWindow:")
        menuItem.keyEquivalent = "p"
        
        var menuSeparator = NSMenuItem.separatorItem()
        
        quitItem.title = "Quit"
        quitItem.action = Selector("quitProgram:")
        
        menu.addItem(menuItem)
        menu.addItem(menuSeparator)
        menu.addItem(quitItem)
        
    }
    
    func openWifiWindow(sender: AnyObject) {
        controller.showPassword(self)
    }
    
    func quitProgram(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

