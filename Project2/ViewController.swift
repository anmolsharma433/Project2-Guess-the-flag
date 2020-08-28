//
//  ViewController.swift
//  Project2
//
//  Created by Anmol Sharma on 2020-08-28.
//  Copyright © 2020 Anmol Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Russia","Spain","UK","US"]
        
    }
    
    func askQuestions(){
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }


}

