//
//  GameController.swift
//  Simon
//
//  Created by Alexander Kaump on 9/13/15.
//  Copyright © 2015 Alexander Kaump. All rights reserved.
//

import Foundation

class GameController
{
    
    var generatedArray = []
    var runningArray = []

    
    func processInput()
    {
        
    }

    func randomButton()
    {
        var i = 1
        while i <= 10
        {
            let random = arc4random_uniform(9) + 1
            print(random)
            i = i + 1
        }
    }

    func initialize()
    {
        
    }

    
}
