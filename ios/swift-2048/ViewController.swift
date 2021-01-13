//
//  ViewController.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. Released under the terms of the MIT license.
//

import UIKit

class ViewController: UIViewController {
    
    private let blueViewController: ReactScreenViewController
    private let redViewController: ReactScreenViewController
    private let reactNativeBridge: ReactNativeBridge

    required init?(coder aDecoder: NSCoder) {
        reactNativeBridge = ReactNativeBridge()
        
        blueViewController = ReactScreenViewController(moduleName: "BlueScreen", bridge: reactNativeBridge.bridge)
        redViewController = ReactScreenViewController(moduleName: "RedScreen", bridge: reactNativeBridge.bridge)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func highScoresButtonTapped(_ sender: Any) {
        let scores = ReactNativeViewController(bridge: reactNativeBridge.bridge)
        scores.modalPresentationStyle = .fullScreen
        present(scores, animated: true, completion: nil)
    }
    
    
    @IBAction func startGameButtonTapped(sender : UIButton) {
        let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
        game.modalPresentationStyle = .fullScreen
        self.present(game, animated: true, completion: nil)
    }
    
    @IBAction func showRedScreen(_ sender: Any) {
        self.present(redViewController, animated: true, completion: nil)
    }

    @IBAction func showBlueScreen(_ sender: Any) {
        self.present(blueViewController, animated: true, completion: nil)
    }
}

