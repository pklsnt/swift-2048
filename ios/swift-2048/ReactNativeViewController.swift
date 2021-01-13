//
//  ReactNativeViewController.swift
//  swift-2048
//
//  Created by PATRICK LESAINT on 12/12/2020.
//  Copyright © 2020 Austin Zheng. All rights reserved.
//
import UIKit
import React

class ReactNativeViewController: UIViewController {
    
    private var bridge: RCTBridge!

    init(bridge: RCTBridge) {
        super.init(nibName: nil, bundle: nil)
        self.bridge = bridge
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupReactNative()
        registerToReactNativeEvents()
    }

    private func setupReactNative() {

        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]
        
        let rootView = RCTRootView(bridge: bridge, moduleName: "ReactNativeModal", initialProperties:  mockData as [NSObject : AnyObject])
            
//        let rootView = RCTRootView(
//            bridge: bridge,
//            moduleName: "ReactNativeModal",
//            initialProperties: mockData as [NSObject : AnyObject],
//            launchOptions: nil
//        )
        self.view = rootView
    }

    private func registerToReactNativeEvents() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(closeModal),
                                               name: NSNotification.Name(rawValue: ReactEventCloseModal),
                                               object: nil)
    }

    @objc private func closeModal() {
        DispatchQueue.main.async { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
    }
}
