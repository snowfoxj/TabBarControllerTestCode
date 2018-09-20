//
//  ViewController.swift
//  TabBarControllerTestCode
//
//  Created by user on 2018/09/20.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 背景色適当に変えて違うページ感を表現する
        self.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(100))/100.0, green: CGFloat(arc4random_uniform(100))/100.0, blue: CGFloat(arc4random_uniform(100))/100.0, alpha: 1)
        
        // ページを変えるボタンを作る
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 100, width: 0, height: 0)
        button.setTitle(self.title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 48)
        // 48の文字サイズが収まる大きさにサイズを変更
        button.sizeToFit()
        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func tapButton(_ button:UIButton ) {
        
        // ページ番号取り出し
        var pageIndex = self.tabBarController!.selectedIndex
        
        // 次のページにする
        pageIndex+=1
        
        // ページが超えたら最初に戻す
        pageIndex %= (self.tabBarController!.viewControllers?.count)!
        
        // ページを変える
        self.tabBarController!.selectedIndex = pageIndex
    }
}

