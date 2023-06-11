//
//  RunningViewController.swift
//  sportsMan
//
//  Created by 高昕荣 on 2023/6/5.
//

import Foundation
import UIKit
import AudioToolbox


class RunningViewController: UIViewController {
    
    @IBOutlet var toTimer: UIButton!
    @IBOutlet var Person: UIImageView!
    @IBOutlet var hintText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        toTimer.isEnabled = false
//        toTimer.alpha = 0
//        toTimer.setTitle("Shake Your Phone to WARM UP!", for: toTimer.state)
//        toTimer.setTitleColor(.gray, for: toTimer.state)
//        toTimer.setTitle("开始！", for: toTimer.state)
//        toTimer.setTitleColor(.red, for: toTimer.state)
//        Person.image = UIImage(named: "1_WarmUp")
    }
    
//    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        if event?.subtype == UIEvent.EventSubtype.motionShake {
//            // vibrate
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//            // change state of button
//            toTimer.alpha = 100
//            toTimer.isEnabled = true
//            toTimer.setTitle("START", for: toTimer.state)
//            toTimer.setTitleColor(.red, for: toTimer.state)
//            Person.image = UIImage(named: "1_WarmUp")
//
//        }
//    }
    
    @IBAction func startTimerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toTimer", sender: self)
    }
    
}
