//
//  AlternatelyScene.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/4/5.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import Foundation
import SpriteKit

class AlternatelyScene: SKScene {
    
    var lastUpdateTime : TimeInterval = 0       // 上一次更新的时间
    var dt : TimeInterval = 0                   // 时间间距
    let manMovePointsPerSec : CGFloat = 480.0   // 精灵在每秒钟移动的点
    var velocity = CGPoint.zero                 // 速度
    var lastTouchLocation : CGPoint?            // 上一次触摸的位置
    let manRotateRadiansPerSec : CGFloat = 4.0 * π  // 精灵在每秒旋转弧度
    
    var _manNode: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.black
        
        self.createNode()
    }
    
    // 创建精灵
    func createNode() {
        _manNode = SKSpriteNode.init(imageNamed: "man_1")
        _manNode.position = CGPoint.init(x: 150, y: KScreenHeight - 150)
        _manNode.size = CGSize.init(width: 200, height: 150)
        self.addChild(_manNode)
        self.addAction(node: _manNode)
    }
    // 添加动画
    func addAction(node: SKSpriteNode) {
        let textures = NSMutableArray.init()
        for index in 1...4 {
            let textture = SKTexture.init(imageNamed: "sword_\(index)")
            textures.add(textture)
        }
        let manAction = SKAction.animate(with: textures as! [SKTexture], timePerFrame: 0.1)
        let manAnim = SKAction.repeatForever(manAction)
        node.run(manAnim)
    }
    
    // 移动精灵方法
    func moveSprite(sprite:SKSpriteNode, point: CGPoint) {
        let amountToMove = point * CGFloat(dt)
        sprite.position += amountToMove
    }
    
    // 实现精灵向前移动
    func moveManToward(location: CGPoint) {
        let offset = location - _manNode.position   // 偏移量
        let direction = offset.normalized()         // 方向
        velocity = direction * manMovePointsPerSec  // 速度
    }
    func sceneTouched(touchLocation: CGPoint) {
        lastTouchLocation = touchLocation
        moveManToward(location: touchLocation)
    }
    
    // 旋转精灵
    func rotateSprite(sprite: SKSpriteNode, direction: CGPoint, rotateRadiansPerSec: CGFloat) {
        let shortest = shortestAngleBetween(sprite.zRotation, angle2: velocity.angle)
        let amountToRatate = min(rotateRadiansPerSec * CGFloat(dt), abs(shortest))
        sprite.zRotation += shortest.sign() * amountToRatate    // 旋转精灵
    }
    
    
    // 数据更新
    override func update(_ currentTime: TimeInterval) {
        // 判断上一次更新时间是否大于0
        if(lastUpdateTime > 0){
            dt = currentTime - lastUpdateTime   // 获取时间间隔
        }else {
            dt = 0
        }
        
        lastUpdateTime = currentTime
        if let lastTouch = lastTouchLocation {
            let diff = lastTouch - _manNode.position    // 获取上次触摸位置和精灵位置距离
            if(diff.length() <= manMovePointsPerSec * CGFloat(dt)){
                _manNode.position = lastTouchLocation!
                velocity = CGPoint.zero
            }else {
                moveSprite(sprite: _manNode, point: velocity)
                rotateSprite(sprite: _manNode, direction: velocity, rotateRadiansPerSec: manRotateRadiansPerSec)
            }
        }
    }
    
    // MARK: 触摸
    // 单拍、 多拍
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mytouches = touches as NSSet
        let touch: AnyObject? = mytouches.anyObject() as AnyObject
        if(touch?.tapCount == 1){
            // 单拍
            //            backgroundColor = UIColor.orange
            let touchLocation = touch?.location(in: self)
            sceneTouched(touchLocation: touchLocation!)
        }
        if(touch?.tapCount == 2) {
            //            backgroundColor = UIColor.blue
        }
    }
    
    // 移动触摸
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mytouchs = touches as NSSet
        let touch = mytouchs.anyObject() as! UITouch
        let touchLocation = touch.location(in: self)
        sceneTouched(touchLocation: touchLocation)
    }
    
    // 结束触摸
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        backgroundColor = UIColor.green
    }
    
    
}
