//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewPropertyAnimatorController: UIViewController {
    
    var animatoin: UIViewPropertyAnimator!
    var scaleAnimation: CABasicAnimation!
    
    @IBOutlet weak var animationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesterRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler))
        self.view.addGestureRecognizer(gesterRecognizer)
    }
    
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            
            //Анимация в процессе
            let timingParameters = UISpringTimingParameters(mass: 2.0, stiffness: 30.0, damping: 7.0, initialVelocity: .zero)
            
            animatoin = UIViewPropertyAnimator(duration: 0.5, timingParameters: timingParameters)
            
            animatoin.addAnimations {
                let scale: CGFloat = 1.5
                // расстояние на которое вью откатывается
                self.animationView.center.x += 300
                // угол вращения
                self.animationView.transform = CGAffineTransform(rotationAngle: 3 * .pi / 4)
                // Увеличение обьема
                self.animationView.transform = self.animationView.transform.scaledBy(x: scale, y: scale)
            }
            animatoin.pauseAnimation()
            
        case .changed:
            animatoin.fractionComplete = recognizer.translation(in: self.view).x / view.bounds.size.width
            
        case .ended:
            let animViewPresent = animationView.layer.presentation()
            let a = animViewPresent?.position
            let viewPresent = view.layer.presentation()
            let b = viewPresent?.position
            
            guard let viewPoint = b ?? nil else {return}
            guard let animationView = a ?? nil else {return}
            // выполняем условие при котором вью возвращаетс или продолжает анимацию
            if animationView.x > viewPoint.x {
                animatoin.isReversed = false
                animatoin.startAnimation()
            } else {
                animatoin.isReversed = true
                animatoin.startAnimation()
            }
        default:
            ()
        }
    }
}
