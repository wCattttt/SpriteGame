//
//  AlternatelyViewController.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/4/6.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import Foundation
import SpriteKit

class AlternatelyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createAlternateScene()
    }
    
    
    // 创建场景、交互
    func createAlternateScene() {
        let skView = SKView.init(frame: self.view.bounds)
        if(skView.scene == nil){
            skView.showsFPS = true
            skView.showsNodeCount = true
            let scene = AlternatelyScene(size: skView.bounds.size)
            skView.presentScene(scene)
        }
        self.view.addSubview(skView)
    }
}
