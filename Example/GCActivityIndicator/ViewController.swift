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

    private var animating: Bool = false

    private var activityIndicators: [GCActivityIndicator] {
        return view.subviews.compactMap {
            return $0 as? GCActivityIndicator
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityIndicators()
    }


    @IBAction func toggleAnimating() {
        if animating {
            animateButton.setTitle("Start", for: .normal)
            activityIndicators.forEach {
                $0.stopAnimating()
            }
        } else {
            animateButton.setTitle("Stop", for: .normal)
            activityIndicators.forEach {
                $0.startAnimating()
            }
        }
        animating = !animating
    }

    func configureActivityIndicators() {
        for i in 0..<activityIndicators.count {
            let activity = activityIndicators[i]
            activity.hidesWhenStopped = false
            activity.rings = examples[activity.tag]
        }
    }
}

