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
    
    var startTime: String!
    var endTime: String!
    var duration: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timerLabel.text = "00:00"
        counter = 0
        // get start time
        let date = Date()
        let zone = NSTimeZone.system
        let time = zone.secondsFromGMT(for: date)
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        startTime = formatter.string(from: date.addingTimeInterval(TimeInterval(time)))
        // Do any additional setup after loading the view.
    }
    

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        counter = 0
        // get end time
        let date = Date()
        let zone = NSTimeZone.system
        let time = zone.secondsFromGMT(for: date)
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        endTime = formatter.string(from: date.addingTimeInterval(TimeInterval(time)))
        // record the new record
        recordList.append(Record(st: startTime, et: endTime, du: duration))
        performSegue(withIdentifier: "toMain1", sender: self)
    }
    
    @objc func updateTimer() {
        counter += 1
        let minutes = counter / 60
        let seconds = counter % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        duration = String(format: "%02d:%02d", minutes, seconds)
        let formatter = DateFormatter()
        let tz = TimeZone.init(identifier: "Asia/Beijing")
        formatter.timeZone = tz
        endTime = formatter.string(from: Date.init())
        
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
    
}
