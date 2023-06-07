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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        toTimer.isEnabled = false
//        toTimer.alpha = 0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            // vibrate
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            // change state of button
            toTimer.alpha = 100
            toTimer.isEnabled = true
        }
    }
    
    @IBAction func startTimerTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toTimer", sender: self)
    }
    
}
