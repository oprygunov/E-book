//
//  IconCheckView.swift
//  
//
//  Created by Vadim Mukhin on 25.03.2023.
//

import UIKit

public class IconCheckView: UIView {

    public var hasNumber: Bool = false {
        didSet {
            if hasNumber { checkIcon.image = Image(named: "CheckGreen")
            } else {
                checkIcon.image = Image(named: "Dot-icon")
            }
        }
    }

    public var hasMinimumCharacters: Bool = false {
        didSet {
            if hasMinimumCharacters { checkIconSecond.image = Image(named: "CheckGreen")
            } else {
                checkIconSecond.image = Image(named: "Dot-icon")
            }
        }
    }
    
    enum Action {
        case text(String)
    }

    var actionHandler: (Action) -> Void = {_ in }

    private var checkIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Image(named: "Dot-icon")
        return view
    }()

    private var checkIconSecond: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Image(named: "Dot-icon")
        return view
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .textFirst
        view.font = UIFont(name: "SFProText-Regular", size: 16)
        view.text = "минимум одна цифра"
        return view
    }()

    private let subTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .textFirst
        view.font = UIFont(name: "SFProText-Regular", size: 16)
        view.text = "минимум 8 знаков"
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(checkIcon)
        addSubview(titleLabel)
        addSubview(checkIconSecond)
        addSubview(subTitleLabel)

        checkIcon.leftAnchor ~= leftAnchor + 40
        checkIcon.topAnchor ~= topAnchor

        titleLabel.leftAnchor ~= checkIcon.rightAnchor + 8
        titleLabel.centerYAnchor ~= checkIcon.centerYAnchor

        checkIconSecond.leftAnchor ~= checkIcon.leftAnchor
        checkIconSecond.topAnchor ~= checkIcon.bottomAnchor + 1
        checkIconSecond.bottomAnchor ~= bottomAnchor

        subTitleLabel.leftAnchor ~= checkIconSecond.rightAnchor + 8
        subTitleLabel.centerYAnchor ~= checkIconSecond.centerYAnchor
    }
}
