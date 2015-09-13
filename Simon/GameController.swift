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
    
    var generatedArray: [Int] = []
    var runningArray: [Int] = []
    
    func processInput(parameter:Int)
    {
        runningArray.append(parameter)
        let isValid = self.validateArrays()
        if(!isValid)
        {
            viewController?.showGameOverScreen()
            return
        }
        if(runningArray.count == generatedArray.count)
        {
            runningArray = []
            generatedArray.append(self.randomButton())
            
            self.viewController?.killTimer()
            
            let delay = 1.0 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue())
            {
                self.viewController?.showSequence(self.generatedArray)
                self.viewController!.incrementRoundCount()
            }

        }
        self.viewController!.incrementTapCount()
    }
    
    func randomButton() ->Int
    {
        return Int(arc4random_uniform(9)) + 1
    }

    func startGame()
    {
        generatedArray = []
        runningArray = []
        
        generatedArray.append(self.randomButton())

        self.viewController?.showSequence(generatedArray)
        self.viewController!.incrementRoundCount()
    }

    func validateArrays() -> Bool {
        for (var i = 0; i < runningArray.count; i++)
        {
            if(runningArray[i] != generatedArray[i])
            {
                return false
            }
        }
        return true
    }
}

