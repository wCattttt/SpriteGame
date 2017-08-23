//
//  GestureRecognizer.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/4/6.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion

var sprite = SKSpriteNode.init(imageNamed: "ao.jpg")
var lastScale: CGFloat = 0.0

class GestureRecognizerScene: SKScene {
    
    override func didMove(to view: SKView) {
        sprite.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        self.addChild(sprite)
        
        self.addGestureRecognizer()
        
    }
    
    // MARK: 手势
    func addGestureRecognizer() {
//        let tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.handleTap))
//        self.view?.addGestureRecognizer(tapGestureRecognizer)
//        
//        let pinchGestureRecognizer = UIPinchGestureRecognizer.init(target: self, action: #selector(handlepin(recognizer:)))
//        self.view?.addGestureRecognizer(pinchGestureRecognizer)
//        
//        let rotationGestureRecognizer = UIRotationGestureRecognizer.init(target: self, action: #selector(handRotation(recognizer:)))
//        self.view?.addGestureRecognizer(rotationGestureRecognizer)
//        
//        let panGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(handPan(recognizer:)))
//        self.view?.addGestureRecognizer(panGestureRecognizer)
        
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(handSwipeLeft))     // 向左滑动
        swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirection.left;
        self.view?.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(handSwipeRight))     // 向右滑动
        swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right;
        self.view?.addGestureRecognizer(swipeRightGestureRecognizer)
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(handLongPress))
        self.view?.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    // 轻拍
    func handleTap() {
        backgroundColor = UIColor.yellow
    }
    
    // 捏
    func handlepin(recognizer: UIPinchGestureRecognizer) {
        self.view?.bringSubview(toFront: view!)
        // 复原
        if(recognizer.state == UIGestureRecognizerState.ended){
            lastScale = 1.0
            return
        }
        
        let scale: CGFloat = 1.0 - (lastScale - recognizer.scale)
        let current: CGAffineTransform = recognizer.view!.transform
        let newaa = current.scaledBy(x: scale, y: scale)
        recognizer.view?.transform = newaa
        lastScale = recognizer.scale
        
    }
    
    // 旋转
    func handRotation(recognizer: UIRotationGestureRecognizer) {
        let rataion:CGFloat = recognizer.rotation
        sprite.zRotation = -rataion
    }
    
    // 移动
    func handPan(recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: self.view)
        let pointY = (self.view?.frame.size.height)! - point.y
        sprite.position = CGPoint.init(x: point.x, y: pointY)
    }
    
    // 滑动
    func handSwipeLeft() {
        let actionMove = SKAction.move(to: CGPoint.init(x: sprite.size.width/2, y: KScreenHeight/2), duration: 1)
        sprite.run(actionMove)
    }
    func handSwipeRight() {
        let actionMove = SKAction.move(to: CGPoint.init(x: KScreenWidth - sprite.size.width/2, y: KScreenHeight/2), duration: 1)
        sprite.run(actionMove)
    }
    
    // 长按
    func handLongPress() {
        backgroundColor = UIColor.gray
    }
    
    
}
