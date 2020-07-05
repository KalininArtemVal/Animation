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
    
    var dynamicAnimatonr: UIDynamicAnimator!
    
    override func viewDidLoad() {
        viewDidLoad()
        let gesterForOrange = UITapGestureRecognizer(target: self, action: #selector(self.animationViewTapHandler(sender:)))
        self.animationView.addGestureRecognizer(gesterForOrange)
    }
    
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        
        
    }
    
    
    
}
