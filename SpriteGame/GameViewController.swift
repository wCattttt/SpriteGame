//
//  GameViewController.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/3/31.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createScene()
        
    }

    // 创建场景
    func createScene() {
        let skView = SKView.init(frame: self.view.bounds)
        if(skView.scene == nil){
            skView.showsFPS = true
            skView.showsNodeCount = true
            let scene = GameScene(size: skView.bounds.size)
            skView.presentScene(scene)
        }
        self.view.addSubview(skView)
    }
    
    

}
