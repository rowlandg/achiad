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
  @IBOutlet weak var startOverButton: UIButton!
  
  var currentValue = 50
  var targetValue = 0
  var round = 1
  var score = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    startNewGame()
    updateLabels()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference

    switch (points) {
    case 100:
      title = "Perfect!"
      points += 100
    case 90..<100:
      title = "Oooh, so close!"
      points += 25
    case 75..<90:
      title = "Not bad"
    case 50..<75:
      title = "Come on, try harder"
    default:
      title = "Rubbish!"
    }
    
    score += points
    let message = "Grats! You scored \(points)"
    
    let alert = UIAlertController(title: title			,
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK",
                               style: .default,
                               handler: { action in
                                          self.startNewRound()
                                          self.updateLabels()
                                        })
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    round += 1
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
  
  func startNewGame() {
    round = 0
    score = 0
    startNewRound()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  @IBAction func startOver() {
    startNewGame()
    updateLabels()
  }
}

