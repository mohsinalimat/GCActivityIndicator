//
//  ActivityRing.swift
//  GCActivityIndicator
//
//  Created by Graham Chance on 7/29/18.
//  Copyright © 2018 Graham Chance. All rights reserved.
//

import Foundation
import UIKit

public struct ActivityRing {

    public let clockwise: Bool
    public let lineWidth: CGFloat
    public let color: CGColor
    public let start: CGFloat
    public let end: CGFloat
    public let overlaps: Bool

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
