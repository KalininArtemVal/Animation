//
//  CAKeyframeAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CAKeyframeAnimationController: UIViewController {
    
    @IBOutlet weak var passcodeTextField: UITextField!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var startShakeAnimationButton: UIButton!
    @IBOutlet weak var startSinAnimationButton: UIButton!
    
    @IBAction func shakeAnimationTapHandler(sender: UIButton) {
        shake()
    }
    
    @IBAction func sinAnimationTapHandler(sender: UIButton) {
        moveView()
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSinPath()
        
    }
}

extension CAKeyframeAnimationController {
    private func showSinPath() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = sinPath()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    private func sinPath() -> CGPath {
        let startPoint = orangeView.center
        let width = self.view.bounds.width - 2 * startPoint.x
        let height = self.view.bounds.height / 6.0
        return CGPath.sinPath(startPoint: startPoint, width: width, height: height, periods: 1.5)
    }
    
    private func shake() {
        let animationShake = CAKeyframeAnimation()
        animationShake.keyPath = "position.x"
        animationShake.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animationShake.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.8, 1]
        animationShake.duration = 0.4
        animationShake.isAdditive = true
        animationShake.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.passcodeTextField.layer.add(animationShake, forKey: "shake")
        self.passcodeTextField.layer.position = passcodeTextField.center
    }
    
    private func moveView() {
        let path = sinPath()
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path
        animation.rotationMode = CAAnimationRotationMode.rotateAuto
        animation.timeOffset = 0.0
        animation.duration = 6
        animation.repeatCount = .infinity
        animation.calculationMode = CAAnimationCalculationMode.paced
        self.orangeView.layer.add(animation, forKey: "animate position along path")
    }
}
