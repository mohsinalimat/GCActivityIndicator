//
//  ActivityRing.swift
//  GCActivityIndicator
//
//  Created by Graham Chance on 7/29/18.
//  Copyright © 2018 Graham Chance. All rights reserved.
//

import Foundation
import UIKit


/// Models an individual ring in a GCActivityIndicator.
public struct ActivityRing {

    /// Color of the ring line.
    public let color: CGColor

    /// Start angle of the ring line. Ranges from 0.0 to 1.0.
    public let start: CGFloat

    /// End angle of the ring line. Ranges from 0.0 to 1.0.
    public let end: CGFloat

    /// Whether the ring should animate in a clockwise direction.
    public let clockwise: Bool

    /// Width of the ring line relative to its container. Ranges from 0.0 to 1.0.
    public let lineWidth: CGFloat

    /// Whether the ring line should overlap its preceding ActivityRing
    public let overlaps: Bool


    /// Constructor
    ///
    /// - Parameters:
    ///   - color: Color of the ring line.
    ///   - start: Start angle of the ring line. Ranges from 0.0 to 1.0.
    ///   - end: End angle of the ring line. Ranges from 0.0 to 1.0.
    ///   - clockwise: Whether the ring should animate in a clockwise direction.
    ///   - lineWidth: Width of the ring line relative to its container. Ranges from 0.0 to 1.0.
    ///   - overlaps: Whether the ring line should overlap its preceding ActivityRing
    public init(color: CGColor,
                start: CGFloat,
                end: CGFloat,
                clockwise: Bool,
                lineWidth: CGFloat = 0.1,
                overlaps: Bool = false
        ) {
        self.clockwise = clockwise
        self.lineWidth = lineWidth
        self.color = color
        self.start = start
        self.end = end
        self.overlaps = overlaps
    }

}
