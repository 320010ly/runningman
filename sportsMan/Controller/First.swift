//
//  First.swift
//  sportsMan
//
//  Created by liuyu on 2023/6/8.
//

import Foundation
import UIKit

class First:UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func entermainview(_ sender: UIButton) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainvc = mainstoryboard.instantiateViewController(withIdentifier: "main")
        //self.navigationController?.pushViewController(mainvc, animated: true)
        mainvc.modalPresentationStyle = .fullScreen
        self.present(mainvc, animated: true)
    }
    
    
}
