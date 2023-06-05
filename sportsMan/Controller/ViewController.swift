//
//  ViewController.swift
//  sportsMan
//
//  Created by liuyu on 2023/6/4.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var startRunning: UIButton!
    
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
    
    
    @IBAction func startPressed(_ sender: Any) {
        performSegue(withIdentifier: "toRunning", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRunning" {
            //let destVC = segue.destination as! //ResultViewController
            //destVC.bmiValue = calculator.getBMIValue()
            //destVC.advice = calculator.getAdvice()
            //destVC.color = calculator.getColor()
        }
    }
    
}

