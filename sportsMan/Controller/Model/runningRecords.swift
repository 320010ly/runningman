//
//  runningRecords.swift
//  sportsMan
//
//  Created by 高昕荣 on 2023/6/7.
//

import Foundation

struct Record {
    let startTime: String
    let endTime: String
    let duration: String
    
    init (st: String, et: String, du: String) {
        self.startTime = st
        self.endTime = et
        self.duration = du
    }
}

var recordList: [Record] = [Record]()
