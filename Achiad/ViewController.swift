//
//  ViewController.swift
//  Achiad
//
//  Created by Rowland Gault on 14/01/2017.
//  Copyright © 2017 Rogue Application Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  var currentValue = 50
  var targetValue = 0
  var round = 1
  var score = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    startNewRound()
    updateLabels()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    let points = 100 - difference
    score += points
    
    let message = "Grats! You scored \(points)"
    
    let alert = UIAlertController(title: "Hello, World",
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK",
                               style: .default,
                               handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    round += 1
    startNewRound()
    updateLabels()
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    //print("The value of the slider is now: \(slider.value)")
    currentValue = lroundf(slider.value)
  }
  
  func startNewRound() {
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
}

