//
//  ReactNativeBridge.swift
//  swift-2048
//
//  Created by PATRICK LESAINT on 13/12/2020.
//  Copyright © 2020 Austin Zheng. All rights reserved.
//
import React

class ReactNativeBridge {
    let bridge: RCTBridge

    init() {
        bridge = RCTBridge(delegate: ReactNativeBridgeDelegate(), launchOptions: nil)
    }
}

class ReactNativeBridgeDelegate: NSObject, RCTBridgeDelegate {

    func sourceURL(for bridge: RCTBridge!) -> URL! {
        return URL(string: "http://localhost:8081/index.bundle?platform=ios")
    }
}
