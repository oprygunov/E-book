//
//  LaunchScreenView.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import UIComponents

final class LaunchScreenView: View {
    
    var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Image(named: "Logo")
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(image)
    }

    override func setupLayout() {
        super.setupLayout()
        
        image.centerYAnchor ~= centerYAnchor
        image.centerXAnchor ~= centerXAnchor
        
    }
}
