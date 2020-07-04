//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesterForOrange = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        self.orangeView.addGestureRecognizer(gesterForOrange)
        
        let gesterForCyanView = UITapGestureRecognizer(target: self, action: #selector(self.tappedOnCyanView(_:)))
        self.cyanView.addGestureRecognizer(gesterForCyanView)
        
        let gesterForBlueView = UITapGestureRecognizer(target: self, action: #selector(tappedOnBlue(_:)))
        self.blueView.addGestureRecognizer(gesterForBlueView)
        
        let gesterGreenView = UITapGestureRecognizer(target: self, action: #selector(tappedOnGreen(_:)))
        self.greenView.addGestureRecognizer(gesterGreenView)
    }
    
    
    //MARK: - Orange
    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            self.orangeView.layer.cornerRadius = self.orangeView.frame.size.width / 2
        }
    }
    //MARK: - Cyan
    @objc private func tappedOnCyanView(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            self.cyanView.layer.opacity = 0.0
        }
    }
    //MARK: - Blue
    @objc private func tappedOnBlue(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            let value = CGPoint(x: 345.0, y: self.blueView.center.y)
            let moveAnimation = CABasicAnimation(keyPath: "move")
            moveAnimation.fromValue = self.blueView.center
            moveAnimation.toValue = value
            moveAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            self.blueView.layer.add(moveAnimation, forKey: "move")
            self.blueView.layer.position = value
            
            self.blueView.transform = CGAffineTransform(rotationAngle: 2 * .pi / 3)
            
            let groupeAnimation = CAAnimationGroup()
            groupeAnimation.animations = [moveAnimation]
            
        }
    }
    //MARK: - Green
    @objc private func tappedOnGreen(_ sender: UITapGestureRecognizer) {
        
        let scaleValue: CGFloat = 1.5
        let positionValue = self.view.center
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = scaleValue
        scaleAnimation.autoreverses = true
        
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = self.greenView.center
        positionAnimation.toValue = positionValue
        positionAnimation.autoreverses = true
        
        let currentColor = self.greenView.backgroundColor
        let finalColot = UIColor.magenta
        let changeColor = CAKeyframeAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        changeColor.values = [currentColor?.cgColor ?? UIColor.red.cgColor, finalColot.cgColor]
        changeColor.keyTimes = [0.0, 0.5]
        changeColor.autoreverses = true
        greenView.layer.add(changeColor, forKey: "color")
        greenView.backgroundColor = currentColor
        
        let groupeAnimation = CAAnimationGroup()
        groupeAnimation.animations = [positionAnimation, changeColor, scaleAnimation]
        groupeAnimation.duration = 1.0
        groupeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        groupeAnimation.repeatCount = 2
        groupeAnimation.autoreverses = true
        
        self.greenView.layer.add(groupeAnimation, forKey: "groupeAnimation")
        self.greenView.layer.position = self.greenView.center
    }
}
