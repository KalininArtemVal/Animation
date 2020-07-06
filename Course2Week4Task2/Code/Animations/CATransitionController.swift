//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        transition()
    }
    
    private func transition() {
        
        
        let transition = CATransition()
        transition.duration = 1.0

        transition.type = CATransitionType.moveIn
        transition.repeatDuration = 0
        
        
        self.textLabel.layer.add(transition, forKey: "change")
        self.textLabel.textColor = UIColor.green
        self.textLabel.text = "Sliding!"
        

        let nextTransition = CATransition()
        nextTransition.duration = 1.0
        nextTransition.type = CATransitionType.fade
        
        self.textLabel.layer.add(nextTransition, forKey: "changeTwo")
        self.textLabel.textColor = UIColor.orange
        
        
    }
}
