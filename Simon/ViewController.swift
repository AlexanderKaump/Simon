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
    
    var gameController : GameController = GameController()
    var mySound: SystemSoundID = 0
    
    override func viewDidLoad() {
        let soundURL = NSBundle.mainBundle().URLForResource("blip", withExtension: "wav")
        AudioServicesCreateSystemSoundID(soundURL!, &self.mySound)
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

    @IBAction func dismissGameOverScreen(sender: AnyObject) {
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.startGameView.alpha = 0
            }) { (coplete) -> Void in
            self.gameController.startGame()
        }
        
    }
    
    func showSequence(sequence: [Int]) {
        
        for (var i = 0; i < sequence.count; i++) {
            let number = sequence[i]
            let button = self.buttonOfNumber(number)!
            
            let delay = 0.5 * Double(i) * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.flashButton(button)
            }
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
        self.playSound()
    }
    
    func playSound() {
        AudioServicesPlaySystemSound(self.mySound)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

