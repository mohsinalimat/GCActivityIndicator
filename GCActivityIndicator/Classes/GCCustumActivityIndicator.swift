//
//  GCCustumActivityIndicator.swift
//  GCActivityIndicator
//
//  Created by Graham Chance on 7/29/18.
//  Copyright © 2018 Graham Chance. All rights reserved.
//

import Foundation
import UIKit

public class GCCustomActivityIndicator: UIView {

    public var hidesWhenStopped: Bool = true

    public private(set) var isAnimating: Bool = false

    public var rings: [ActivityRing] = [] {
        didSet {
            configureRings()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    private func configureView() {
        backgroundColor = UIColor.clear
        configureRings()
    }

    private var ringLayers: [ActivityRingLayer] {
        return (layer.sublayers ?? []).compactMap {
            return $0 as? ActivityRingLayer
        }
    }

    private func configureRings() {
        removeAllRings()
        addRingLayers()
    }

    public func stopAnimating() {
        isAnimating = false
        isHidden = hidesWhenStopped
        ringLayers.forEach {
            $0.currentAnimation = nil
        }
    }

    public func startAnimating() {
        isAnimating = true
        isHidden = false
        addAnimations()
    }

    private func addAnimations() {
        ringLayers.forEach {
            $0.startAnimating()
        }
    }

    private func removeAllRings() {
        ringLayers.forEach {
            $0.removeFromSuperlayer()
        }
    }

    private func addRingLayers() {
        let radii = calculateRadii()
        for i in 0..<rings.count {
            let ring = rings[i]
            let ringLayer = ActivityRingLayer(frame: bounds, ring: ring, radius: radii[i])
            layer.addSublayer(ringLayer)
        }
    }

    private func calculateRadii() -> [CGFloat] {
        var radii = [CGFloat]()
        let maxDiameter = min(bounds.width, bounds.height)
        let maxRadius = maxDiameter / 2
        for i in 0..<rings.count {
            let ring = rings[i]
            if i == 0 {
                radii.append(maxRadius - ring.lineWidth * maxRadius)
            } else if rings[i].overlaps {
                radii.append(radii[i-1] - (ring.lineWidth - rings[i-1].lineWidth) * maxRadius)
            } else {
                radii.append(radii[i-1] - (rings[i-1].lineWidth * maxDiameter) / 2 - (ring.lineWidth * maxDiameter) / 2)
            }
        }
        return radii
    }

}
