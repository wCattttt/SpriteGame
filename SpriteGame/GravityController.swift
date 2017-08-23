//
//  GravityController.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/8/23.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GravityController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor =  UIColor.orange
     
        createGravityScene()
    }
    
    // 创建重力感应场景
    func createGravityScene() {
        let skView = SKView.init(frame: self.view.bounds)
        if(skView.scene == nil){
            skView.showsFPS = true
            skView.showsNodeCount = true
            let scene = GravityScene(size: skView.bounds.size)
            skView.presentScene(scene)
        }
        self.view.addSubview(skView)
    }
}
