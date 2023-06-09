//
//  ViewController.swift
//  sportsMan
//
//  Created by liuyu on 2023/6/4.
//

import UIKit

class ViewController: UIViewController {
    //the top txt
    
    @IBOutlet weak var headview: UIView!
    @IBOutlet weak var leaderview: UIView!
    
    
    
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
    //in mainpage
    @IBOutlet var startRunning: UIButton!
    @IBOutlet var mainPIc: UIImageView!
    @IBOutlet weak var ws_msg: UIView!
    var ws_msg_show = false
    
    
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
    
    @IBOutlet weak var msgtitle: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var get_img: UIImageView!
    @IBOutlet weak var get_tea_button: UIButton!
    
    //in datapage
    @IBOutlet var recordTableView: UITableView!
    @IBOutlet var timeSum: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    var records: [Record] = []
    var selectIndex = 0
    var allTime = 0
    
    //in personpage
    
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var goal: UILabel!
    
    
    @IBOutlet weak var switchmode: UISwitch!
    
    @IBOutlet weak var reset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
//        let gradientLayer  = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.white.cgColor]
//        gradientLayer.startPoint = CGPoint(x:0,y:0)
//        gradientLayer.endPoint = CGPoint(x:0,y:0.39)
//        mainpage.layer.insertSublayer(gradientLayer, at: 0)
        switchmode.isOn = false
        
        //hide the whip-sweat reminder
        if (ws_msg_show){
            ws_msg.isHidden = false
        }else{
            ws_msg.isHidden = true
        }
        
        //set black border for items in shop
        for item in items{
            item.layer.borderWidth = 2.0
            item.layer.borderColor = UIColor.black.cgColor
            item.layer.cornerRadius = 5
            item.clipsToBounds = true
        }
        
        msg.isHidden = true
        //person page
        reset.layer.cornerRadius = reset.frame.size.height / 2
        reset.clipsToBounds = true
        if usergoal != nil {
            gender.text = "性别：" + usergender!.rawValue
            goal.text = "运动目标：" + usergoal!.rawValue
        }
        else {
            gender.text = "性别：女"
            goal.text = "运动目标：减重"
        }
        //gender.text = "性别：" + usergender!.rawValue
        //goal.text = "运动目标：" + usergoal!.rawValue

        //data page
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = Record.fetchRequest()

        do {
            records = try context.fetch(request)

        } catch {
            print("Failed to get data!")
        }
        
        recordTableView.dataSource = self //
        
        for i in records {
            allTime += Int(i.duration ?? "0") ?? 0
            print("allTime: ")
            print(allTime)
        }
        print(allTime)
        let minutes = (allTime / 60) % 60
        let hours = (allTime / 60) / 60
        timeSum.text = String(format: "%02d时%02d分", hours, minutes) //
        
        progressView.progress = Float(allTime) / 30.0
        
        if (allTime >= 15 && allTime < 30) {
            mainPIc.image = UIImage(named: "0_Medium")
        } else if (allTime >= 30) {
            mainPIc.image = UIImage(named: "0_Thin")
        }
        
        startRunning.isHidden = false
        mainbutton.backgroundColor = UIColor(white: 1, alpha: 0)
        print("view did load")
    }
    
    // start to exercise
    @IBAction func startPressed(_ sender: Any) {
        performSegue(withIdentifier: "toRunning", sender: self)
    }
    
    //exercise ends and whip the sweat
    @IBAction func wsPressed(_ sender: Any) {
        ws_msg.isHidden = true
        ws_msg_show = false
        self.mainPIc.image = UIImage(named: "1_Sweat")
        self.startRunning.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if (self.allTime < 15) {
                self.mainPIc.image = UIImage(named: "0_Heavy")
            } else if (self.allTime < 30) {
                self.mainPIc.image = UIImage(named: "0_Medium")
            } else {
                self.mainPIc.image = UIImage(named: "0_Thin")
            }
            self.startRunning.isEnabled = true
        }
    }
    
    
    //the four func below change the page
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
        
        startRunning.isHidden = false
        mainbutton.tintColor = UIColor(white: 1, alpha: 0)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = Record.fetchRequest()

        do {
            records = try context.fetch(request)

        } catch {
            print("Failed to get data!")
        }
        
        recordTableView.dataSource = self //
        
        for i in records {
            allTime += Int(i.duration ?? "0") ?? 0
            print("allTime: ")
            print(allTime)
        }
        
        if (allTime >= 15 && allTime < 30) {
            mainPIc.image = UIImage(named: "0_Medium")
        } else if (allTime >= 30) {
            mainPIc.image = UIImage(named: "0_Thin")
        }
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
        
        startRunning.isHidden = true
        
        if switchmode.isOn {
            mainbutton.tintColor = UIColor(named:"darktext")
        }else {
            mainbutton.tintColor = UIColor(named:"leader_color")
        }
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
        
        startRunning.isHidden = true
        if switchmode.isOn {
            mainbutton.tintColor = UIColor(named:"darktext")
        }else {
            mainbutton.tintColor = UIColor(named:"leader_color")
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = Record.fetchRequest()

        do {
            records = try context.fetch(request)

        } catch {
            print("Failed to get data!")
        }
        
        recordTableView.dataSource = self
        
        for i in records {
            allTime += Int(i.duration ?? "0") ?? 0
            print("allTime: ")
            print(allTime)
        }
        print(allTime)
        let minutes = (allTime / 60) % 60
        let hours = (allTime / 60) / 60
        timeSum.text = String(format: "%02d时%02d分", hours, minutes) //
        
        progressView.progress = Float(allTime) / 30.0
        
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
        
        startRunning.isHidden = true
        if switchmode.isOn {
            mainbutton.tintColor = UIColor(named:"darktext")
        }else {
            mainbutton.tintColor = UIColor(named:"leader_color")
        }
    }
    
    //the four button below change the items in the shop view
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
        sportbutton.backgroundColor = UIColor(named:"shopbutton_chosen")
        sportbutton.setTitleColor(UIColor.black, for: .normal)
        healthbutton.backgroundColor = UIColor.white
        healthbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        
        block_food.isHidden = true
        block_drink.isHidden = true
        block_sport.isHidden = false
        block_health.isHidden = true
    }
    
    @IBAction func healthPressed(_ sender: Any) {
        foodbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        drinkbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sportbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        healthbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        foodbutton.backgroundColor = UIColor.white
        foodbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        drinkbutton.backgroundColor = UIColor.white
        drinkbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        sportbutton.backgroundColor = UIColor.white
        sportbutton.setTitleColor(UIColor(named:"word_0"), for: .normal)
        healthbutton.backgroundColor = UIColor(named:"shopbutton_chosen")
        healthbutton.setTitleColor(UIColor.black, for: .normal)
        
        block_food.isHidden = true
        block_drink.isHidden = true
        block_sport.isHidden = true
        block_health.isHidden = false
    }
    
    // the four func below call the msgbox in the shopview
    @IBAction func closemsg(_ sender: Any) {
        msg.isHidden = true
        get_img.isHidden = true
    }
    
    @IBAction func openmsg_dr_1(_ sender: Any) {
        msg.isHidden = false
        
        msgtitle.text = "茶"
        detail.numberOfLines = 0
        detail.lineBreakMode = .byWordWrapping
        detail.text = "茶，对我们的健身及整体健康有诸多益处。绿茶富含抗氧化物质，能增强体质，提高新陈代谢，有助于燃烧脂肪。乌龙茶和黑茶可助消化，补充运动后的能量。"
    
    }
    
    @IBAction func openmsg_dr_2(_ sender: Any) {
        msg.isHidden = false
        msgtitle.text = "酒"
        detail.numberOfLines = 0
        detail.lineBreakMode = .byWordWrapping
        detail.text = "适量饮用红酒对身体健康和健身有积极影响。红酒含有抗氧化剂，可以降低心脏病风险，提高好胆固醇。然而，过量饮酒会影响运动表现，损害肌肉恢复。"
    }
    //person page
    
    @IBAction func getPressed(_ sender: Any) {
        detail.text = ""
        get_img.isHidden = false
        msg.isHidden = false
        get_img.image = UIImage(named:"2_Drink")
        msgtitle.text = "饮茶有助健康"
    }
    
    //the two func below are the settings in the personview
    @IBAction func switchmode(_ sender: UISwitch) {
        if sender.isOn {
            headview.backgroundColor = UIColor(named: "darkbg")
            head.textColor = UIColor(named: "darktext")
            
            leaderview.backgroundColor = UIColor(named: "darkbg")
            mainbutton.tintColor = UIColor(named: "darktext")
            shopbutton.tintColor = UIColor(named: "darktext")
            databutton.tintColor = UIColor(named: "darktext")
            personbutton.tintColor = UIColor(named: "darktext")
            startRunning.backgroundColor = UIColor(named: "darkbg")
            startRunning.tintColor = UIColor(named: "darktext")
            
            
        } else{
            headview.backgroundColor = UIColor(named: "cover")
            head.textColor = UIColor(named: "custom")
            
            leaderview.backgroundColor = UIColor(named: "cover")
            shopbutton.tintColor = UIColor(named: "leader_color")
            databutton.tintColor = UIColor(named: "leader_color")
            personbutton.tintColor = UIColor(named: "leader_color")
            mainbutton.tintColor = UIColor(named: "leader_color")
            startRunning.backgroundColor = UIColor(named: "cover")
            startRunning.tintColor = UIColor(named: "leader_color")
            
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "First", bundle: nil)
        let mainvc = mainstoryboard.instantiateViewController(withIdentifier: "firstview")
        //self.navigationController?.pushViewController(mainvc, animated: true)
        mainvc.modalPresentationStyle = .fullScreen
        self.present(mainvc, animated: true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        for i in records {
            context.delete(i)
            do {
                try context.save()
            } catch {
                print("删除失败")
            }
        }
    }
    
    
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = records[indexPath.row].startTime
        content.secondaryText = records[indexPath.row].endTime
        cell.contentConfiguration = content
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "edit", sender: nil)
    }
}
