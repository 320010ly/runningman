//
//  First.swift
//  sportsMan
//
//  Created by liuyu on 2023/6/8.
//

import Foundation
import UIKit

enum gender:String{
    case male = "男"
    case female = "女"
}
enum sportgoal:String{
    case weightloss = "减重"
    case shape = "塑形"
    case health = "健康"
    case muscle = "增肌"
}

class First:UIViewController{
    
    var usergender:gender?
    var usergoal:sportgoal?
    
    @IBOutlet weak var male: UIButton!
    
    @IBOutlet weak var female: UIButton!
    
    @IBOutlet weak var weightloss: UIButton!
    
    @IBOutlet weak var muscle: UIButton!
    
    @IBOutlet weak var shape: UIButton!
    
    @IBOutlet weak var health: UIButton!
    
    
    
    @IBOutlet weak var enter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //radius for enter button
        enter.layer.cornerRadius = enter.frame.size.height / 2
        enter.clipsToBounds = true
        
        weightloss.layer.cornerRadius = weightloss.frame.size.height / 2
        weightloss.clipsToBounds = true
        
        muscle.layer.cornerRadius = muscle.frame.size.height / 2
        muscle.clipsToBounds = true
        
        shape.layer.cornerRadius = shape.frame.size.height / 2
        shape.clipsToBounds = true
        
        health.layer.cornerRadius = health.frame.size.height / 2
        health.clipsToBounds = true
        
        //set border
        weightloss.layer.borderWidth = 2.0
        weightloss.layer.borderColor = UIColor.black.cgColor
        muscle.layer.borderWidth = 2.0
        muscle.layer.borderColor = UIColor.black.cgColor
        shape.layer.borderWidth = 2.0
        shape.layer.borderColor = UIColor.black.cgColor
        health.layer.borderWidth = 2.0
        health.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func male(_ sender: UIButton) {
        usergender = .male
        male.setImage(UIImage(named: "male_chosen"), for: .normal)
        female.setImage(UIImage(named: "female"), for: .normal)
    }
    
    @IBAction func female(_ sender: UIButton) {
        usergender = .female
        female.setImage(UIImage(named: "female_chosen"), for: .normal)
        male.setImage(UIImage(named: "male"), for: .normal)
    }
    
    @IBAction func weightloss(_ sender: UIButton) {
        usergoal = .weightloss
        weightloss.backgroundColor = UIColor(named: "cover")
        muscle.layer.backgroundColor = UIColor.white.cgColor
        shape.layer.backgroundColor = UIColor.white.cgColor
        health.layer.backgroundColor = UIColor.white.cgColor
    }
    
    @IBAction func muscle(_ sender: UIButton) {
        usergoal = .muscle
        muscle.backgroundColor = UIColor(named: "cover")
        weightloss.layer.backgroundColor = UIColor.white.cgColor
        shape.layer.backgroundColor = UIColor.white.cgColor
        health.layer.backgroundColor = UIColor.white.cgColor
    }
    
    @IBAction func shape(_ sender: UIButton) {
        usergoal = .shape
        shape.backgroundColor = UIColor(named: "cover")
        muscle.layer.backgroundColor = UIColor.white.cgColor
        weightloss.layer.backgroundColor = UIColor.white.cgColor
        health.layer.backgroundColor = UIColor.white.cgColor
    }
    
    
    @IBAction func health(_ sender: UIButton) {
        usergoal = .health
        health.backgroundColor = UIColor(named: "cover")
        muscle.layer.backgroundColor = UIColor.white.cgColor
        shape.layer.backgroundColor = UIColor.white.cgColor
        weightloss.layer.backgroundColor = UIColor.white.cgColor
    }
    
    
    
    
    @IBAction func entermainview(_ sender: UIButton) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainvc = mainstoryboard.instantiateViewController(withIdentifier: "main")
        //self.navigationController?.pushViewController(mainvc, animated: true)
        mainvc.modalPresentationStyle = .fullScreen
        self.present(mainvc, animated: true)
    }
    
    
}
