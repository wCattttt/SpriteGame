//
//  NewGameScene.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/3/31.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import UIKit
import SpriteKit

// MARK: 场景
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.orange
        self.scaleMode = SKSceneScaleMode.fill
        
//        self.addNode()
        
//        self.addLightNode()
        
//        self.nodeAction()
        
//        self.scaleAction()
        
//        self.rotateAction()
        
//        self.groupAction()
        
//        self.alphaAction()
        
//        self.colorAction()
        
//        self.animateTexturesAction()
        
        self.pathAction()
        
        
    }
    
    // MARK: 添加精灵
    func addNode() {
        let texture = SKTexture.init(imageNamed: "ao.jpg")  // 纹理
        let splash = SKSpriteNode.init(texture: texture)
//        let splash = SKSpriteNode.init(imageNamed: "ao.jpg")
        splash.size = CGSize.init(width: KScreenWidth, height: KScreenHeight)
        splash.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        // 设置锚点
//        splash.anchorPoint = CGPoint.init(x: 0.0, y: 0.0)
        // 精灵着色
        splash.color = SKColor.green
        splash.colorBlendFactor = 0.3   // 颜色混合因子0~1
        splash.setScale(2)  // 缩放 放大两倍
//        splash.xScale = 2   // 单独缩放x
        splash.zRotation = CGFloat(Double.pi)/2  // 旋转
        splash.alpha = 0.5
        splash.isHidden = false
        self.addChild(splash)
        
//        splash.removeFromParent()
//        removeAllChildren()
    }
    
    // MARK: 光源效果
    func addLightNode() {
        backgroundColor = SKColor.black
        // 创建精灵
        let spriNode = SKSpriteNode.init(color: UIColor.white, size: CGSize.init(width: 300, height: 300))
        spriNode.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        self.addChild(spriNode)
        // 添加光源
        let nodeNormMap = spriNode.texture?.generatingNormalMap()
        spriNode.normalTexture = nodeNormMap
        spriNode.lightingBitMask = 1    // 被何种光照
        spriNode.name = "SprNOde"
        let lightSprite = SKLightNode() //实例化光源
        lightSprite.position = CGPoint.init(x: KScreenWidth/2 + 60, y: KScreenHeight/2) // 关照位置
        lightSprite.name = "LightSptite"
        lightSprite.categoryBitMask = 1 // 光的种类
        self.addChild(lightSprite)
    }
    
    // MARK: 动作
    func nodeAction() {
        let texture = SKTexture.init(imageNamed: "field")  // 纹理
        let background = SKSpriteNode.init(texture: texture)
        background.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        background.size = CGSize.init(width: KScreenWidth, height: KScreenHeight)
        self.addChild(background)
        
        let ball = SKSpriteNode.init(imageNamed: "soccer")
        ball.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        ball.setScale(1.05) // 缩放
        ball.size = CGSize.init(width: 50, height: 50)
        self.addChild(ball)
        
        // 动作  以点的方式移动
        let spriteMoveUp = SKAction.moveBy(x: 300, y: 0, duration: 1.0) // X方向向右移100
        spriteMoveUp.speed = 1.3  // 速度
        spriteMoveUp.timingMode = SKActionTimingMode.easeInEaseOut  // 曲线方式
//        ball.run(spriteMoveUp)
        print(ball.speed)   // 获取并输出动作所需时间
        
        // 动作  以偏移量的方式移动
        let negDelta = CGVector.init(dx: -300, dy: -100)
        let actionMove = SKAction.move(by: negDelta, duration: 2) // X方向向右移100
        actionMove.speed = 1.3  // 速度
        actionMove.timingMode = SKActionTimingMode.easeInEaseOut  // 曲线方式
//        ball.run(actionMove)
        
        // 序列动作
        let wait = SKAction.wait(forDuration: 1.0)  // 延迟动作
        let sequence = SKAction.sequence([spriteMoveUp, wait, actionMove])
//        let runForever = SKAction.repeatForever(sequence)   // 无限重复
        let runRepeat = SKAction.repeat(sequence, count: 2)   // 重复两次(执行两次)
        ball.run(runRepeat)
        
    }
    
    // MARK: 缩放动作
    func scaleAction() {
        let ball = SKSpriteNode.init(imageNamed: "soccer")
        ball.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        ball.size = CGSize.init(width: 50, height: 50)  // 设置初始大)
        self.addChild(ball)
        
        // 以缩放倍数缩放
        let shrink = SKAction.scale(to: 0.1, duration: 0.5) // 缩小
        let zoom = SKAction.scale(to: 10, duration: 2) // 放大
        // 对宽高进行缩放
//        let shrink = SKAction.scaleX(to: 0.1, duration: 3) // 缩小
//        let zoom = SKAction.scale(to: 1, duration: 3) // 放大
        let sequence = SKAction.sequence([shrink, zoom])
        let runForever = SKAction.repeatForever(sequence)
//        ball.run(runForever)
        
        // 以增量值缩放
        let scaleZoom = SKAction.scale(by: 1, duration: 0.2)    // 放大
        let scaleShrink = SKAction.scale(by: -1, duration: 0.2) // 缩小
//        let scaleZoom = SKAction.scaleX(by: 1, duration: 0.2)    // 放大
//        let scaleShrink = SKAction.scaleX(by: -1, duration: 0.2) // 缩小
        let scaleSequence = SKAction.sequence([scaleZoom, scaleShrink])
        let scaleForever = SKAction.repeatForever(scaleSequence)
        ball.run(scaleForever)
    }
    
    // MARK: 旋转动作
    func rotateAction() {
        let ball = SKSpriteNode.init(imageNamed: "soccer")
        ball.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        ball.size = CGSize.init(width: 50, height: 50)  // 设置初始大)
        self.addChild(ball)
        
        let rotate = SKAction.rotate(byAngle: CGFloat(Double.pi)*2, duration: 3)
        let runForever = SKAction.repeatForever(rotate)
        ball.run(runForever)
        
        // MARK: 调整尺寸的动作
        let resizeWidth = SKAction.resize(toWidth: 100, height: 100, duration: 2)   // 以目标值调整尺寸
        ball.run(resizeWidth)
        
        let resize = SKAction.resize(byWidth: 200, height: 200, duration: 2)   // 以增量调整尺寸
        ball.run(resize)
        
    }
    
    // MARK: 组合动作
    func groupAction() {
        backgroundColor = SKColor.black
        
        let star = SKSpriteNode.init(imageNamed: "star.jpg")
        star.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        star.size = CGSize.init(width: 300, height: 300)
        self.addChild(star)
        
        let zoom = SKAction.scale(to: 1, duration: 0.2)
        let shrink = SKAction.scale(to: 0.1, duration: 0.2)
        let sequence = SKAction.sequence([zoom, shrink])
        let rotate = SKAction.rotate(byAngle: CGFloat(Double.pi)*2, duration: 1.5)
        
        let group = SKAction.group([sequence, rotate])  // 组合动画
        let runForever = SKAction.repeatForever(group)
        star.run(runForever)
    }
    
    // MARK: 改变透明度的动作
    func alphaAction() {
        let ball = SKSpriteNode.init(imageNamed: "soccer")
        ball.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        ball.size = CGSize.init(width: 50, height: 50)
        self.addChild(ball)
        // 不需要指定alpha值
        let fadeOut = SKAction.fadeOut(withDuration: 0.25)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        let sequence = SKAction.sequence([fadeOut, fadeIn])
        let runRepeat = SKAction.repeatForever(sequence)
//        ball.run(runRepeat)
        // 指定alpha值
        let fadeOutAlpha = SKAction.fadeAlpha(to: 0, duration: 0.2) // 以目标值指定
        let fadeInAlpha = SKAction.fadeAlpha(to: 1, duration: 0.2)
//        let hide = SKAction.fadeAlpha(by: -1, duration: 0.2)    // 以增量值指定
//        let show = SKAction.fadeAlpha(by: 1, duration: 0.2)
        let sequenceAlpha = SKAction.sequence([fadeOutAlpha, fadeInAlpha])
//        let sequenceAlpha = SKAction.sequence([hide, show])
        let runRepeatAlpha = SKAction.repeatForever(sequenceAlpha)
        ball.run(runRepeatAlpha)
    }
    
    // MARK: 改变颜色的动作
    func colorAction() {
        let splash = SKSpriteNode.init(imageNamed: "ao.jpg")
        splash.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        self.addChild(splash)
        
        // 改变混合因子
        let color1 = SKAction.colorize(withColorBlendFactor: 0.8, duration: 0.5)
        let color2 = SKAction.colorize(withColorBlendFactor: 0.0, duration: 0.5)
        let sequence = SKAction.sequence([color1, color2])
        let runRepeat = SKAction.repeatForever(sequence)
//        splash.run(runRepeat)
        
        // 改变颜色和混合因子
        let color = SKAction.colorize(with: SKColor.green, colorBlendFactor: 0.7, duration: 2)
        splash.run(color)
    }
    
    // MARK: 以动画形式改变纹理的动作
    func animateTexturesAction() {
        // 加载动画纹理
        let textures = NSMutableArray.init()
        for index in 4...13 {
            let texture = SKTexture.init(imageNamed: "frame-\(index)")
            textures.add(texture)
        }
        
        let playerSprite = SKSpriteNode.init(texture: textures.firstObject as? SKTexture)
        playerSprite.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        self.addChild(playerSprite)
        
        let runRightAction = SKAction.animate(with: textures as! [SKTexture], timePerFrame: 0.1)
        let runForever = SKAction.repeatForever(runRightAction)
        playerSprite.run(runForever)
    }
    
    // MARK: 路径动作
    func pathAction() {
        let background = SKSpriteNode.init(imageNamed: "field")
        background.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        background.size = CGSize.init(width: KScreenWidth, height: KScreenHeight)
        self.addChild(background)
        
        let ball = SKSpriteNode.init(imageNamed: "soccer")
        ball.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        ball.size = CGSize.init(width: 50, height: 50)
        self.addChild(ball)
        
        let circle = CGPath.init(roundedRect: CGRect.init(x: 200, y:100 , width: 200, height: 200), cornerWidth: 100, cornerHeight: 100, transform: nil)
        let follow = SKAction.follow(circle, asOffset: false, orientToPath: false, duration: 5)
        let runRepeat = SKAction.repeatForever(follow)
        // 反向运动
        let reverse = runRepeat.reversed()
        // 速度动作
        let speedaction = SKAction.speed(to: 15, duration: 1.0)
        let group = SKAction.group([speedaction, reverse])
        ball.run(group)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
