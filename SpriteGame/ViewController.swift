//
//  ViewController.swift
//  SpriteGame
//
//  Created by 魏唯隆 on 2017/3/31.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

import UIKit

let KScreenWidth = UIScreen.main.bounds.width
let KScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._initView()
    }
    
    func _initView() {
        let label = UILabel.init(frame: CGRect(x: 0, y: 80, width: KScreenWidth, height: 35))
        label.text = "这是一个label"
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.orange
        label.textColor = UIColor.white
        self.view.addSubview(label)
        
        let button = UIButton.init(frame: CGRect(x: 100, y: 130, width: KScreenWidth - 200, height: 35))
        button.backgroundColor = UIColor.init(colorLiteralRed: 12.2/255, green: 48.2/255, blue: 120.2/255, alpha: 0.8)
        button.setTitle("按钮", for: UIControlState.normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.addTarget(self, action: #selector(changeImgView), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        let imageView = UIImageView.init(frame: CGRect(x: 40, y: 180, width: KScreenWidth - 80, height: KScreenWidth - 40))
        imageView.tag = 101
        imageView.image = UIImage.init(named: "ao.jpg")
        self.view.addSubview(imageView)
        
    }
    
    func changeImgView(button : UIButton!) {
        button.isSelected = !button.isSelected
        let imageView = self.view.viewWithTag(101)
        if(button.isSelected){
            imageView?.isHidden = true
        }else {
            imageView?.isHidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

