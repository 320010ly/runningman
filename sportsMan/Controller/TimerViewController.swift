//
//  TimerViewController.swift
//  sportsMan
//
//  Created by 高昕荣 on 2023/6/6.
//

import UIKit

class TimerViewController: UIViewController {
    
    var timer = Timer()
    var counter = 0
    
    var timerState = true
    
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timerLabel.text = "00:00"
        counter = 0
        // Do any additional setup after loading the view.
    }
    

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        counter = 0
//        timerLabel.text = "00:00"
        performSegue(withIdentifier: "toMain1", sender: self)
    }
    
    @objc func updateTimer() {
        counter += 1
        let mimutes = counter / 60
        let seconds = counter % 60
        timerLabel.text = String(format: "%02d:%02d", mimutes, seconds)
        
    }
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        if (timerState == true) {
            timer.fireDate = Date.distantFuture
            pauseButton.setTitle("Continue", for: .normal)
            timerState = false
        } else {
            timer.fireDate = Date.distantPast
            pauseButton.setTitle("Pause", for: .normal)
            timerState = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
