//
//  ViewController.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//

import UIKit
import Scenes

class ViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
        viewControllers = [LaunchScreenBuilder.build()]
    }
}

