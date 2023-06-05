//
//  ViewController.swift
//  sportsMan
//
//  Created by liuyu on 2023/6/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gradientLayer  = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.white.cgColor]
        
        gradientLayer.startPoint = CGPoint(x:0,y:0)
        gradientLayer.endPoint = CGPoint(x:0,y:0.39)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}

