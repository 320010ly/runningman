//
//  ViewController.swift
//  sportsMan
//
//  Created by liuyu on 2023/6/4.
//

import UIKit

class ViewController: UIViewController {

    //the buttons on the bottom
    @IBOutlet weak var mainbutton: UIButton!
    @IBOutlet weak var shopbutton: UIButton!
    @IBOutlet weak var databutton: UIButton!
    @IBOutlet weak var personbutton: UIButton!
    
    //the four main-body pages
    @IBOutlet weak var mainpage: UIView!
    @IBOutlet weak var shoppage: UIView!
    @IBOutlet weak var datapage: UIView!
    @IBOutlet weak var personpage: UIView!
    
    //the other small parts in every page
    //in leader
    @IBOutlet var startRunning: UIButton!
    //in mainpage
    
    //in shoppage
    
    //in datapage
    
    //in personpage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gradientLayer  = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x:0,y:0)
        gradientLayer.endPoint = CGPoint(x:0,y:0.39)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //yourView.layer.borderWidth = 5.0
        //yourView.layer.borderColor = UIColor.black.cgColor
        
//        print(recordList)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let request = Record.fetchRequest()
//        var records: [Record] = []
//
//        do {
//            records = try context.fetch(request)
//
//        } catch {
//            print("Failed to get data!")
//        }
//        print(records[2].startTime)
    }
    
    
    @IBAction func startPressed(_ sender: Any) {
        performSegue(withIdentifier: "toRunning", sender: self)
    }
    
    @IBAction func mainPressed(_ sender: Any) {
        mainbutton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        shopbutton.setBackgroundImage(UIImage(systemName: "bag"), for: .normal)
        databutton.setBackgroundImage(UIImage(systemName: "chart.bar"), for: .normal)
        personbutton.setBackgroundImage(UIImage(systemName: "person"), for: .normal)
        
        mainpage.isHidden = false
        shoppage.isHidden = true
        datapage.isHidden = true
        personpage.isHidden = true
    }
    
    @IBAction func shopPressed(_ sender: Any) {
        mainbutton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        shopbutton.setBackgroundImage(UIImage(systemName: "bag.fill"), for: .normal)
        databutton.setBackgroundImage(UIImage(systemName: "chart.bar"), for: .normal)
        personbutton.setBackgroundImage(UIImage(systemName: "person"), for: .normal)
        
        mainpage.isHidden = true
        shoppage.isHidden = false
        datapage.isHidden = true
        personpage.isHidden = true
    }
    
    @IBAction func dataPressed(_ sender: Any) {
        mainbutton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        shopbutton.setBackgroundImage(UIImage(systemName: "bag"), for: .normal)
        databutton.setBackgroundImage(UIImage(systemName: "chart.bar.fill"), for: .normal)
        personbutton.setBackgroundImage(UIImage(systemName: "person"), for: .normal)
        
        mainpage.isHidden = true
        shoppage.isHidden = true
        datapage.isHidden = false
        personpage.isHidden = true
    }
    
    @IBAction func personPressed(_ sender: Any) {
        mainbutton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        shopbutton.setBackgroundImage(UIImage(systemName: "bag"), for: .normal)
        databutton.setBackgroundImage(UIImage(systemName: "chart.bar"), for: .normal)
        personbutton.setBackgroundImage(UIImage(systemName: "person.fill"), for: .normal)
        
        mainpage.isHidden = true
        shoppage.isHidden = true
        datapage.isHidden = true
        personpage.isHidden = false
    }
}

