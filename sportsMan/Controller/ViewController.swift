//
//  ViewController.swift
//  sportsMan
//
//  Created by liuyu on 2023/6/4.
//

import UIKit

class ViewController: UIViewController {
    //the top txt
    @IBOutlet weak var head: UILabel!
    
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
    @IBOutlet var items: [UIView]!
    @IBOutlet weak var block_food: UIView!
    @IBOutlet weak var block_sport: UIView!
    @IBOutlet weak var block_health: UIView!
    @IBOutlet weak var block_drink: UIView!
    @IBOutlet weak var msg: UIView!
    @IBOutlet weak var foodbutton: UIButton!
    @IBOutlet weak var drinkbutton: UIButton!
    @IBOutlet weak var sportbutton: UIButton!
    @IBOutlet weak var healthbutton: UIButton!
    
    //in datapage
    
    //in personpage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
        let gradientLayer  = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x:0,y:0)
        gradientLayer.endPoint = CGPoint(x:0,y:0.39)
        mainpage.layer.insertSublayer(gradientLayer, at: 0)
        
        //set black border for items in shop
        for item in items{
            item.layer.borderWidth = 2.0
            item.layer.borderColor = UIColor.black.cgColor
            item.layer.cornerRadius = 5
            item.clipsToBounds = true
        }
        
        msg.isHidden = true
        
        

        
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
        
        head.text = "主页"
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
        
        head.text = "生活商场"
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
        
        head.text = "锻炼记录"
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
        
        head.text = "个人"
    }
    
    @IBAction func foodPressed(_ sender: Any) {
        foodbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        drinkbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sportbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        healthbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        foodbutton.backgroundColor = UIColor(named:"shopbutton_chosen")
        foodbutton.setTitleColor(UIColor.black, for: .normal)
        drinkbutton.backgroundColor = UIColor.white
        drinkbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        sportbutton.backgroundColor = UIColor.white
        sportbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        healthbutton.backgroundColor = UIColor.white
        healthbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        
        block_food.isHidden = false
        block_drink.isHidden = true
        block_sport.isHidden = true
        block_health.isHidden = true
    }
    
    @IBAction func drinkPressed(_ sender: Any) {
        foodbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        drinkbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        sportbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        healthbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        foodbutton.backgroundColor = UIColor.white
        foodbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        drinkbutton.backgroundColor = UIColor(named:"shopbutton_chosen")
        drinkbutton.setTitleColor(UIColor.black, for: .normal)
        sportbutton.backgroundColor = UIColor.white
        sportbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        healthbutton.backgroundColor = UIColor.white
        healthbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        
        block_food.isHidden = true
        block_drink.isHidden = false
        block_sport.isHidden = true
        block_health.isHidden = true
    }
    
    @IBAction func sportPressed(_ sender: Any) {
        foodbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        drinkbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sportbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        healthbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        foodbutton.backgroundColor = UIColor.white
        foodbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        drinkbutton.backgroundColor = UIColor.white
        drinkbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        sportbutton.backgroundColor = UIColor.white
        sportbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        healthbutton.backgroundColor = UIColor.white
        healthbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        
        block_food.isHidden = true
        block_drink.isHidden = true
        block_sport.isHidden = false
        block_health.isHidden = true
    }
    
    @IBAction func healthPressed(_ sender: Any) {
        foodbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        drinkbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sportbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        healthbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        foodbutton.backgroundColor = UIColor.white
        foodbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        drinkbutton.backgroundColor = UIColor.white
        drinkbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        sportbutton.backgroundColor = UIColor.white
        sportbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        healthbutton.backgroundColor = UIColor.white
        healthbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        
        block_food.isHidden = true
        block_drink.isHidden = true
        block_sport.isHidden = true
        block_health.isHidden = false
    }
    
    @IBAction func closemsg(_ sender: Any) {
        msg.isHidden = true
    }
    
    @IBAction func openmsg_dr_1(_ sender: Any) {
        msg.isHidden = false
        
    }
    
    @IBAction func openmsg_dr_2(_ sender: Any) {
        msg.isHidden = false
        
    }
}

