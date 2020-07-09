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
    
    func transition() {
        // создаем Транзишн
        let transitionText = CATransition()
        transitionText.delegate = self
        
        // устанавливаем параметры Транзишн
        transitionText.duration = 1.0
        transitionText.type = CATransitionType.moveIn
        transitionText.duration = 1.0
        transitionText.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.textLabel.textColor = UIColor.green
        self.textLabel.text = "Sliding!"
        self.textLabel.layer.add(transitionText, forKey: nil)
    }
    
    func nextTransition(_ duration: TimeInterval = 0.5, completionDelegate: CAAnimationDelegate? = nil) {
        // создаем Транзишн
        let transition = CATransition()
        transition.delegate = completionDelegate
        
        // устанавливаем параметры Транзишн
        transition.duration = 1.0
        transition.type = CATransitionType.fade
        transition.duration = 1.0
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.textLabel.textColor = UIColor.orange
        self.textLabel.text = "Instal text"
        self.textLabel.layer.add(transition, forKey: "change")
    }
}

extension CATransitionController: CAAnimationDelegate {
    // Убиввем nextTransition
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        nextTransition()
    }
}



