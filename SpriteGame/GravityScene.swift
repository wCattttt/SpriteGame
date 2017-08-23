//
//  GravityScene.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/8/23.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import CoreMotion

var mManger:CMMotionManager = CMMotionManager()
class GravityScene: SKScene {
    
    var gravityBall = SKSpriteNode.init(imageNamed: "soccer")
    
    override func didMove(to view: SKView) {
        // 创建两个精灵对象，场景和移动体
        let background = SKSpriteNode.init(imageNamed: "field")
        background.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        background.size = CGSize.init(width: KScreenHeight, height: KScreenWidth)
        self.addChild(background)
        
        gravityBall.position = CGPoint.init(x: KScreenWidth/2, y: KScreenHeight/2)
        gravityBall.size = CGSize.init(width: 50, height: 50)
        self.addChild(gravityBall)
        
        // 判断重力感应是否可用
        if(!mManger.isAccelerometerAvailable){
            // 重力感应不可用
            let alert:UIAlertController = UIAlertController.init(title: "提示", message: "重力感应不可用", preferredStyle: UIAlertControllerStyle.alert)
            let cancel:UIAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(cancel)
            
            self.getCurrentVC()?.present(alert, animated: true, completion: {
            })
            
        }else {
            mManger.startAccelerometerUpdates()
        }
        
        
        // 添加物理引擎，添加物理体
        self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        //创建矩形物理体
        self.gravityBall.physicsBody = SKPhysicsBody.init(rectangleOf: self.gravityBall.frame.size)
        self.gravityBall.physicsBody?.isDynamic = true  // 能承受碰撞和其他外力作用
        self.gravityBall.physicsBody?.affectedByGravity = false // 不承受重力影响
        self.gravityBall.physicsBody?.mass = 0.2    // 给物体任意质量，使移动就会显得自然
        
    }
    
    // 飞创移动的方法
    func ballUpdate() {
        let data:CMAccelerometerData? = mManger.accelerometerData
        // 获取accelerometer数据
        var value:Double? = data?.acceleration.x
        if(value == nil){
            value = 0
        }
        
        // 判断设备倾斜方向
        if(fabs(value!) > 0.2){
            let fvector = CGVector.init(dx: 40*CGFloat(value!), dy: 0)
            self.gravityBall.physicsBody?.applyForce(fvector)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        ballUpdate()
    }
    
    // 当前控制器响应者
    func getCurrentVC()->UIViewController?{
        var result:UIViewController?
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal{
            let windows = UIApplication.shared.windows
            for tmpWin in windows{
                if tmpWin.windowLevel == UIWindowLevelNormal{
                    window = tmpWin
                    break
                }
            }
        }
        
        let fromView = window?.subviews[0]
        if let nextRespnder = fromView?.next{
            if nextRespnder.isKind(of: UIViewController.classForCoder()){
                result = nextRespnder as? UIViewController
            }else{
                result = window?.rootViewController
            }
        }
        return result
    }
}
