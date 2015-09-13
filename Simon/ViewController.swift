//
//  ViewController.swift
//  Simon
//
//  Created by Alexander Kaump on 9/13/15.
//  Copyright © 2015 Alexander Kaump. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var startGameView: UIView!
    
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    var gameController : GameController = GameController()
    
    var blip: SystemSoundID = 0
    var explosion: SystemSoundID = 0
    var count = 5
    var myTimer:NSTimer?
    
    override func viewDidLoad() {
        let blipUrl = NSBundle.mainBundle().URLForResource("blip", withExtension: "wav")
        let explosionUrl = NSBundle.mainBundle().URLForResource("explosion", withExtension: "wav")
        AudioServicesCreateSystemSoundID(blipUrl!, &self.blip)
        AudioServicesCreateSystemSoundID(explosionUrl!, &self.explosion)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        gameController = GameController()
        gameController.viewController = self
        super.viewWillAppear(animated)
    }
    
    @IBAction func processButtonTap(sender: UIButton) {
        
        if (sender == button1)
        {
            gameController.processInput(1)
        }
        else if (sender == button2)
        {
            gameController.processInput(2)
        }
        else if (sender == button3)
        {
            gameController.processInput(3)
        }
        else if (sender == button4)
        {
            gameController.processInput(4)
        }
        else if (sender == button5)
        {
            gameController.processInput(5)
        }
        else if (sender == button6)
        {
            gameController.processInput(6)
        }
        else if (sender == button7)
        {
            gameController.processInput(7)
        }
        else if (sender == button8)
        {
            gameController.processInput(8)
        }
        else if (sender == button9)
        {
            gameController.processInput(9)
        }
        
        self.flashButton(sender)
    }
    
    func killTimer()
    {
        self.count = 5
        self.timerLabel.alpha = 0
        self.timerLabel.text = "5"
        self.myTimer?.invalidate()
    }
    
    func startTimer()
    {
        self.killTimer()
        self.timerLabel.alpha = 1
        self.myTimer = NSTimer.scheduledTimerWithTimeInterval(1.0,
        target: self,
        selector: Selector("updateCountdownLabel"),
        userInfo: nil,
        repeats: true)
    }
    
    func updateCountdownLabel()
    {
        self.timerLabel.text = String(--count)
        
        if (count == 0)
        {
            self.showGameOverScreen()
            self.myTimer?.invalidate()
        }
    }
    
    func incrementTapCount()
    {
        let currentTapString = self.tapsLabel.text
        let currentTapInt = Int(currentTapString!)
        let newTapInt = currentTapInt! + 1
        let newTapString = String(newTapInt)
        self.tapsLabel.text = newTapString
        
    }
    
    func incrementRoundCount()
    {
        let currentRoundString = self.roundLabel.text
        let currentRoundInt = Int(currentRoundString!)
        let newRoundInt = currentRoundInt! + 1
        let newRoundString = String(newRoundInt)
        self.roundLabel.text = newRoundString
    }

    @IBAction func dismissGameOverScreen(sender: AnyObject) {
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.startGameView.alpha = 0
            }) { (coplete) -> Void in
                let delay = 0.5 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue())
                {
                    self.gameController.startGame()
                    self.tapsLabel.text = "0"
                    self.roundLabel.text = "0"
                    
                    
                }
        }
        
    }
    
    func showGameOverScreen()
    {
        self.playSound(self.explosion)
        myTimer?.invalidate()
        
        
        self.timerLabel.alpha = 0
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.startGameView.alpha = 1
            }) { (coplete) -> Void in
        }
    }
    
    func showSequence(sequence: [Int]) {
        
        self.timerLabel.alpha = 0
        
        for (var i = 0; i < sequence.count; i++)
        {
            let number = sequence[i]
            let button = self.buttonOfNumber(number)!
            
            let delay = 0.5 * Double(i) * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.flashButton(button)
            }
        }
        
        let delay = 0.5 * Double(sequence.count) * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.startTimer()

        }

    }
    
    func buttonOfNumber(number: Int) -> UIButton? {
        
        if (number == 1)
        {
            return self.button1
        }
        else if (number == 2)
        {
            return self.button2
        }
        else if (number == 3)
        {
            return self.button3
        }
        else if (number == 4)
        {
            return self.button4
        }
        else if (number == 5)
        {
            return self.button5
        }
        else if (number == 6)
        {
            return self.button6
        }
        else if (number == 7)
        {
            return self.button7
        }
        else if (number == 8)
        {
            return self.button8
        }
        else if (number == 9)
        {
            return self.button9
        }
        
        return nil
    }
    
    func flashButton(button: UIButton) {
            
        button.alpha = 1
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            button.alpha = 0.5
            
            }, completion: { (complete) -> Void in
                
        })
        
        //play a sound
        self.playSound(self.blip)
    }
    
    func playSound(sound: SystemSoundID) {
        AudioServicesPlaySystemSound(sound)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

