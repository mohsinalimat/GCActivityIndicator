//
//  ViewController.swift
//  GCActivityIndicator
//
//  Created by gtchance on 07/29/2018.
//  Copyright (c) 2018 gtchance. All rights reserved.
//

import UIKit
import GCActivityIndicator

class ViewController: UIViewController {

    @IBOutlet weak var animateButton: UIButton!
    @IBOutlet weak var activityIndicator: GCCustomActivityIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityIndicator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleAnimating() {
        if activityIndicator.isAnimating {
            animateButton.setTitle("Start", for: .normal)
            activityIndicator.stopAnimating()
        } else {
            animateButton.setTitle("Stop", for: .normal)
            activityIndicator.startAnimating()
        }
    }

    func configureActivityIndicator() {
        activityIndicator.hidesWhenStopped = false
        activityIndicator.rings = [
            ActivityRing(color: UIColor(rgb: 0x0f3c6c).cgColor, start: 0, end: 0.6, clockwise: true, overlaps: true),
            ActivityRing(color: UIColor(rgb: 0xef4931).cgColor, start: 0.5, end: 1, clockwise: true, overlaps: true),
            ActivityRing(color: UIColor(rgb: 0x99bfbc).cgColor, start: 0.2, end: 0.6, clockwise: false, overlaps: true),
            ActivityRing(color: UIColor(rgb: 0xffd300).cgColor, start: 0.4, end: 0.8, clockwise: false, overlaps: true)
        ]
    }
}

public extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    public convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
