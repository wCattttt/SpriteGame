//
//  GestureRecognizerViewController.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/4/6.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import UIKit
import SpriteKit

class GestureRecognizerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor =  #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        
        createGestureRecognizerScene()
    }
    
    // 创建手势场景
    func createGestureRecognizerScene() {
        let skView = SKView.init(frame: self.view.bounds)
        if(skView.scene == nil){
            skView.showsFPS = true
            skView.showsNodeCount = true
            let scene = GestureRecognizerScene(size: skView.bounds.size)
            skView.presentScene(scene)
        }
        self.view.addSubview(skView)
    }


}
