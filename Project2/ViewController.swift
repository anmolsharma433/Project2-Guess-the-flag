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
    @IBOutlet var labelScore: UILabel!
    @IBOutlet var labelLives: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestionsAsked = 0
    var lives = 3
    var flagToGuess = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        labelLives.text = "Lives: \(lives)"
        labelScore.text = "Score: \(score)"
        
//        button1.layer.borderColor = UIColor.lightGray.cgColor
//        button1.layer.borderColor = UIColor.lightGray.cgColor
//        button1.layer.borderColor = UIColor.lightGray.cgColor
        askQuestions()
    }
    
    func askQuestions(action: UIAlertAction! = nil){
        
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        flagToGuess = countries[correctAnswer].uppercased()
        title = "\(flagToGuess)"
        
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        totalQuestionsAsked += 1
        if totalQuestionsAsked < 10{
        if sender.tag == correctAnswer{ //correct answer
            title = "Correct🥳🥳"
            score += 1
            labelScore.text = "Score: \(score)"
        }
        else{ // wrong answer
            title = "Wrong☹️☹️ Correct option is \(correctAnswer+1)"
            if score < 1{
                score = 0
                labelScore.text = "Score: \(score)"
            }
            else{
                score -= 1
                labelScore.text = "Score: \(score)"
            }
            if lives <= 1
            {
                labelLives.text="Lives :\(lives)"
                gameFinished()
            }
            else{
                lives -= 1
                labelLives.text="Lives :\(lives)"
                }
            }
            let ac = UIAlertController(title: title, message: "Your Score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
            present(ac, animated: true)
        }
        else{
            gameFinished()
        }
    }
    func gameFinished() {
           let ac = UIAlertController(title: "Game Finished", message: "Your Score is \(score) of 10.", preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
           present(ac, animated: true)
           totalQuestionsAsked = 0
           score = 0
           lives = 3
        labelLives.text="Lives :\(lives)"
        labelScore.text = "Score: \(score)"
       }
}

