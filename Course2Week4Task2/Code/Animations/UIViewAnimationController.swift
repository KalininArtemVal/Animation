//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesterForOrange = UITapGestureRecognizer(target: self, action: #selector(self.animationViewTapHandler(sender:)))
        self.animationView.addGestureRecognizer(gesterForOrange)
    }
    
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
        let value = CGPoint(x: 390.0, y: self.animationView.center.y)
        let animation = CABasicAnimation(keyPath: "key")
        animation.fromValue = self.animationView.center
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.animationView.layer.add(animation, forKey: "key")
        self.animationView.layer.position = value
        self.animationView.transform = CGAffineTransform(rotationAngle: .pi)
        
        let groupeAnimation = CAAnimationGroup()
                           groupeAnimation.animations = [animation]
        }
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.flipButton.transform = self.flipButton.transform.rotated(by: .pi)
            self.flipButton.layer.position = self.flipButton.center
            self.view.transform = self.view.transform.rotated(by: .pi)
            self.view.layer.position = self.view.center
        }
    }
}
