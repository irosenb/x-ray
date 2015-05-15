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
    var network: String!
    var password: String {
        get {
            if (CWWiFiClient.sharedWiFiClient().interface().security() == CWSecurity.None) {
                return "None"
            }
            return SSKeychain.passwordForService("AirPort", account: network)
        }
    }
    
    init() {
        network = CWWiFiClient.sharedWiFiClient().interface().ssid()
    }
    
}
