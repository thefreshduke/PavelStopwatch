//
//  ViewController.swift
//  PavelStopwatch
//
//  Created by Scotty Shaw on 8/5/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startTime(sender: AnyObject) {
        validateTimer()
    }
    
    @IBAction func stopTime(sender: AnyObject) {
        timer.invalidate()
        counter = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateTimer() {
        let repeatingFunction = #selector(ViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        counter += 1
        
        let (formattedStringMinutes, formattedStringSeconds, formattedStringMilliseconds) = formatTimeUnitStrings()
        
        timeLabel.text = "\(formattedStringMinutes):\(formattedStringSeconds):\(formattedStringMilliseconds)"
    }
    
    func formatTimeUnitStrings() -> (String, String, String) {
        var numMilliseconds = counter
        
        let numMinutes = numMilliseconds / (60 * 100)
        numMilliseconds -= numMinutes * (60 * 100)
        
        let numSeconds = numMilliseconds / 100
        numMilliseconds -= numSeconds * (100)
        
        let formattedStringMinutes = String(format: "%02d", numMinutes)
        let formattedStringSeconds = String(format: "%02d", numSeconds)
        let formattedStringMilliseconds = String(format: "%02d", numMilliseconds)
        
        return (formattedStringMinutes, formattedStringSeconds, formattedStringMilliseconds)
    }
}

