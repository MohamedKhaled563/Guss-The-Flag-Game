//
//  ViewController.swift
//  GussTheFlag
//
//  Created by Mohamed Khalid on 12/4/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    var countries: [String] = []
    var correctAnswerIndex: Int = 0
    var trials: Int = 0
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addCountries()
        endRound()
    }
    
    func loadButtonsImages(){
        button1.setTitle("", for: .normal)
        button2.setTitle("", for: .normal)
        button3.setTitle("", for: .normal)
        
        button1.setBackgroundImage(UIImage(named: countries[0]), for: .normal)
        button2.setBackgroundImage(UIImage(named: countries[1]), for: .normal)
        button3.setBackgroundImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func createAlertWithMessage(buttonIndex: Int){
        let title: String
        let message: String
        if buttonIndex == correctAnswerIndex{
            title = "Success"
        }
        else{
            title = "Failed"
        }
        updateTrials()
        updateScore(result: title)
        message = "Trials = \(trials)\nScore = \(score)"
        let resultAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Close", style: .default) {_ in
            self.endRound()
        }
        resultAlert.addAction(alertAction)
        present(resultAlert, animated: true)
    }
    func endRound(){
        shuffleCountries()
        correctAnswerIndex = Int.random(in: 0..<2)
        loadButtonsImages()
        navigationItem.title = countries[correctAnswerIndex]
    }
    func updateTrials(){
        trials = trials + 1
    }
    func updateScore(result: String){
        switch result {
        case "Success":
            score = score + 1
        default:
            print()
        }
    }
    func addCountries() {
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
    }
    func shuffleCountries(){
        countries.shuffle()
    }
    @IBAction func button1Action(_ sender: Any) {
        createAlertWithMessage(buttonIndex: 0)
    }
    @IBAction func button2Action(_ sender: Any) {
        createAlertWithMessage(buttonIndex: 1)
    }
    @IBAction func button3Action(_ sender: Any) {
        createAlertWithMessage(buttonIndex: 2)
    }
    
}

