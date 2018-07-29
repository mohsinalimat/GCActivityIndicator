//
//  ActivityRingLayer.swift
//  GCActivityIndicator
//
//  Created by Graham Chance on 7/29/18.
//  Copyright © 2018 Graham Chance. All rights reserved.
//

import Foundation
import UIKit

private let animationKey = "rotationAnimation"

class ActivityRingLayer: CAShapeLayer {

    var currentAnimation: CABasicAnimation? {
        didSet {
            if let animation = currentAnimation {
                add(animation, forKey: animationKey)
            } else {
                removeAnimation(forKey: animationKey)
            }
        }
    }

    private var ring: ActivityRing?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure(ring: nil)
    }

    override init(layer: Any) {
        super.init(layer: layer)
        configure(ring: nil)
    }

    override init() {
        super.init()
    }

    convenience init(frame: CGRect, ring: ActivityRing, radius: CGFloat) {
        self.init()
        self.frame = frame
        configure(ring: ring, radius: radius)
    }

    func startAnimating() {
        guard let ring = ring else { return }
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.8
        animation.isRemovedOnCompletion = false
        animation.fromValue = 0
        animation.toValue = 2 * Double.pi * (ring.clockwise ? 1 : -1)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = Float.infinity
        currentAnimation = animation
    }

    private func configure(ring: ActivityRing?, radius: CGFloat = 0) {
        self.ring = ring
        self.fillColor = UIColor.clear.cgColor

        if let ring = ring {
            self.strokeStart = ring.start
            self.strokeEnd = ring.end
            self.strokeColor = ring.color
            self.lineWidth = min(frame.width, frame.height) * ring.lineWidth
            self.path = createRingPath(radius: radius)
        }
    }

    private func createRingPath(radius: CGFloat) -> CGPath {
        let arcCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        return UIBezierPath(arcCenter: arcCenter,
                            radius: radius,
                            startAngle: CGFloat(0),
                            endAngle: CGFloat(2*Double.pi),
                            clockwise: false
            ).cgPath
    }
}
