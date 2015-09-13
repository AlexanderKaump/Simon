//
//  ViewController.swift
//  Simon
//
//  Created by Alexander Kaump on 9/13/15.
//  Copyright © 2015 Alexander Kaump. All rights reserved.
//

import UIKit

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
        
        let gameController = GameController()
        
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


    }

}

