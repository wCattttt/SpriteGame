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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SpriteKit"
        
        self._initView()
    }
    
    func _initView() {
        let tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sceneCell")
        
        tableView.tableFooterView = UIView.init()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sceneCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "精灵动作"
            
        case 1:
            cell.textLabel?.text = "用户交互 触摸"
            
        case 2:
            cell.textLabel?.text = "用户交互 手势"
            
        case 3:
            cell.textLabel?.text = "重力感应"
            
        default:
            cell.textLabel?.text = "SpriteKit"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(GameViewController(), animated: true)
            
        case 1:
            self.navigationController?.pushViewController(AlternatelyViewController(), animated: true)
            
        case 2:
            self.navigationController?.pushViewController(GestureRecognizerViewController(), animated: true)
            
        case 3:
            self.navigationController?.pushViewController(GravityController(), animated: true)
            
        default:
            print("")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

