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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func processButtonTap(sender: UIButton) {
        
        if (sender == button1) {
            print("1")
        } else if (sender == button2) {
            print("2")
        }
        
        //etc
        
        self.flashButton(sender)
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
        
        let soundURL = NSBundle.mainBundle().URLForResource("blip", withExtension: "wav")
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL!, &mySound)
        AudioServicesPlaySystemSound(mySound);
    }
}

