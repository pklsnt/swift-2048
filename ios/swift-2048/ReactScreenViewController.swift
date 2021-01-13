//
//  ReactScreenViewController.swift
//  swift-2048
//
//  Created by PATRICK LESAINT on 13/12/2020.
//  Copyright © 2020 Austin Zheng. All rights reserved.
//

import UIKit
import React

class ReactScreenViewController: UIViewController {
//    init(moduleName: String) {
//
//        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
//
//        super.init(nibName: nil, bundle: nil)
//        view = RCTRootView(bundleURL: jsCodeLocation!,
//                           moduleName: moduleName,
//                           initialProperties: nil,
//                           launchOptions: nil)
//    }
    
    init(moduleName: String, bridge: RCTBridge) {
        super.init(nibName: nil, bundle: nil)
        view = RCTRootView(bridge: bridge,
                           moduleName: moduleName,
                           initialProperties: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
