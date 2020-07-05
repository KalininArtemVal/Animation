//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
    
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!
    
    var dynamicAnimatonr: UIDynamicAnimator!
    var attachmet: UIAttachmentBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //создаём рекогнайзер для animationView
        let gesterForAnimationView = UITapGestureRecognizer(target: self, action: #selector(self.makeGravity(_:)))
        self.view.addGestureRecognizer(gesterForAnimationView)
        // создаём рекогнайзер anchorView
        self.anchorView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(takeView)))
        
    }
    // Делаем гравитацию по нашатию пальцем на экран
    @objc private func makeGravity(_ sender: UITapGestureRecognizer) {
        dynamicAnimatonr = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [animationView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmet = UIAttachmentBehavior(item: animationView, attachedToAnchor: anchorView.center)
        let gravity = UIGravityBehavior(items: [animationView])
        dynamicAnimatonr.addBehavior(collision)
        dynamicAnimatonr.addBehavior(attachmet)
        dynamicAnimatonr.addBehavior(gravity)
    }
    
    
    // передвигаем зеленый вью
    @objc private func takeView(gester: UIPanGestureRecognizer) {
        let point = gester.location(in: view)
        anchorView.center = point
        attachmet.anchorPoint = point
    }
}
