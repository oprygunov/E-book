//
//  LaunchScreenView.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import UIComponents

final class LaunchScreenView: UIView {
    
    private let label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "E-book"
        view.textColor = .backgroundAlerts
        return view
    }()

    var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Image(named: "temp")
        view.contentMode = .scaleAspectFit
        return view
    }()

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(label)
        addSubview(image)
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        image.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 200).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
