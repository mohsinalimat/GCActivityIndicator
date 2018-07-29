//
//  Examples.swift
//  GCActivityIndicator_Example
//
//  Created by Graham Chance on 7/29/18.
//  Copyright © 2018 Graham Chance. All rights reserved.
//

import Foundation
import GCActivityIndicator

let examples = [
    [
        ActivityRing(color: UIColor(rgb: 0x0f3c6c).cgColor, start: 0, end: 0.6, clockwise: true, overlaps: true),
        ActivityRing(color: UIColor(rgb: 0xef4931).cgColor, start: 0.5, end: 1, clockwise: true, overlaps: true),
        ActivityRing(color: UIColor(rgb: 0x99bfbc).cgColor, start: 0.2, end: 0.6, clockwise: false, overlaps: true),
        ActivityRing(color: UIColor(rgb: 0xffd300).cgColor, start: 0.4, end: 0.8, clockwise: false, overlaps: true)
    ],

    [
        ActivityRing(color: UIColor(rgb: 0x0f3c6c).cgColor, start: 0, end: 0.6, clockwise: true),
        ActivityRing(color: UIColor(rgb: 0xef4931).cgColor, start: 0.5, end: 1, clockwise: true),
        ActivityRing(color: UIColor(rgb: 0x99bfbc).cgColor, start: 0.2, end: 0.6, clockwise: false),
        ActivityRing(color: UIColor(rgb: 0xffd300).cgColor, start: 0.4, end: 0.8, clockwise: false),
        ],

    [
        ActivityRing(color: UIColor.blue.cgColor, start: 0, end: 1, clockwise: true, lineWidth: 0.09),
        ActivityRing(color: UIColor.green.cgColor, start: 0.2, end: 0.8, clockwise: false, lineWidth: 0.1),
        ActivityRing(color: UIColor.green.cgColor, start: 0, end: 0.5, clockwise: true, lineWidth: 0.11, overlaps: true),
        ],

    [
        ActivityRing(color: UIColor(rgb: 0x0f3c6c).cgColor, start: 0, end: 0.5, clockwise: true, lineWidth: 0.13),
        ActivityRing(color: UIColor(rgb: 0xef4931).cgColor, start: 0.5, end: 1, clockwise: true, lineWidth: 0.13, overlaps: true),
        ]
]

fileprivate extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}





