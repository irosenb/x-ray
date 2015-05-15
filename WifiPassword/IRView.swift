//
//  IRTextField.swift
//  WifiPassword
//
//  Created by Isaac Rosenberg on 3/14/15.
//  Copyright (c) 2015 irosenb. All rights reserved.
//

import Cocoa

class IRView: NSView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        // Drawing code here.
    }

    override func mouseDown(theEvent: NSEvent) {
        super.mouseDown(theEvent)
        self.window?.makeFirstResponder(nil)
    }
    
}
