//
//  Wifi.swift
//  WifiPassword
//
//  Created by Isaac Rosenberg on 2/3/15.
//  Copyright (c) 2015 irosenb. All rights reserved.
//

import Cocoa
import CoreWLAN 

class Wifi {
    var network, password: String!
    
    init() {
        network = CWInterface(interfaceName: nil).ssid()
        password = SSKeychain.passwordForService("AirPort", account: network)
    }
    
}
