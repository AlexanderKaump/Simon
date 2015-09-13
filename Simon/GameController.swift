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
    
    var viewController : ViewController?
    
    var generatedArray = []
    var runningArray = []
    
    func processInput(parameter:Int)
    {
        print (runningArray)
        runningArray.append(parameter)
        print(runningArray)
    }
    
    func randomButton() ->Int
    {
        return Int(arc4random_uniform(9)) + 1
    }

    func startGame()
    {
        generatedArray.append(self.randomButton())
        print(generatedArray)
    }

    func validateArrays() -> Bool {
        
       return true
        
    }
}

