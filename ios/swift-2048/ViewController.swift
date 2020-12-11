//
//  ViewController.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. Released under the terms of the MIT license.
//

import UIKit
import React

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func highScoresButtonTapped(_ sender: Any) {
        NSLog("Hello")
          let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
          let mockData:NSDictionary = ["scores":
              [
                  ["name":"Alex", "value":"42"],
                  ["name":"Joel", "value":"10"]
              ]
          ]

          let rootView = RCTRootView(
              bundleURL: jsCodeLocation!,
              moduleName: "RNHighScores",
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil
          )
          let vc = UIViewController()
          vc.view = rootView
          self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func startGameButtonTapped(sender : UIButton) {
        let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
        game.modalPresentationStyle = .fullScreen
        self.present(game, animated: true, completion: nil)
    }
}

