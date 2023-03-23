//
//  Button.swift
//  
//
//  Created by Oleg Prygunov on 22.03.2023.
//

import UIKit

public class Button: UIControl {
    
    var colorButton: Color?
    
    var actionHandler: () -> Void = {}

    public var textSize: CGFloat? {
        didSet {
            title.textSize = textSize
        }
    }

    public var textFont: Label.Fonts? {
        didSet {
            title.textFont = textFont
        }
    }
    
    public var textColor: UIColor? {
        didSet {
            title.textColor = textColor
        }
    }
    
//    public override var isSelected: Bool {
//        didSet {
//            if !isSelected {
//                switch colorButton {
//                case nil:
//                    title.textColor = .buttonDisable
//                    image.tintColor = .buttonDisable
//                case .some(let colors):
//                    switch colors {
//                    case .first:
//                        backgroundColor = .buttonDisable
//                        image.tintColor = .buttonDisable
//                    case .second:
//                        backgroundColor = .buttonOutlineDisable
//                        title.textColor = .buttonDisable
//                        image.tintColor = .buttonDisable
//                        layer.borderWidth = 1
//                        layer.borderColor = UIColor.buttonBorder?.cgColor
//                    }
//                }
//            }
//        }
//    }
    
    public override var isEnabled: Bool {
        didSet {
            if !isEnabled {
                switch colorButton {
                case nil:
                    title.textColor = .buttonDisable
                    image.tintColor = .buttonDisable
                case .some(let colors):
                    switch colors {
                    case .first:
                        backgroundColor = .buttonDisable
                        image.tintColor = .buttonDisable

                    case .second:
                        backgroundColor = .buttonOutlineDisable
                        title.textColor = .buttonDisable
                        image.tintColor = .buttonDisable
                        layer.borderWidth = 1
                        layer.borderColor = UIColor.buttonBorder?.cgColor
                    }
                }
            }
        }
    }
    
    public enum Color {
        case first
        case second
    }
    
    public enum Icon {
        case apple
        case google
        case book
        case headphone
    }
    
    public enum Width {
        case small
        case medium
        case long
    }
    
    private let title: Label = {
        let view = Label(size: 16, font: .ptRootMedium)
        return view
    }()
    
    private let image: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.isUserInteractionEnabled = false
        return view
    }()
    
    public init(text: String, color: Color? = nil, width: Width? = nil, icon: Icon? = nil, iconSpacing: CGFloat? = nil) {
        super.init(frame: .zero)
        
        colorButton = color
        title.text = text
        
        switch color {
        case nil:
            setColor(
                content: .buttonActive
            )
        case .some(let colors):
            switch colors {
            case .first:
                setColor(
                    background: .buttonActive,
                    content: .separator,
                    highlighted: .buttonHover
                )
            case .second:
                setColor(
                    background: .buttonOutlineActive,
                    content: .buttonActive,
                    highlighted: .buttonOutlineHover,
                    border: .buttonBorder,
                    highlightedBorder: .buttonActive
                )
            }
        }
        
        switch icon {
        case nil:
            stack.addArrangedSubview(title)
        case .some(let icons):
            switch icons {
            case .apple:
                image.image = UIImage(systemName: "apple.logo")
            case .google:
                image.image = UIImage(systemName: "apple.logo")
            case .book:
                image.image = UIImage(systemName: "book")
            case .headphone:
                image.image = UIImage(systemName: "headphones")
            }
            stack.addArrangedSubview(image)
            stack.addArrangedSubview(title)
            
            switch iconSpacing {
            case nil:
                break
            case .some(let spacing):
                stack.setCustomSpacing(spacing, after: image)
            }
        }
                
        addSubview(stack)
        
        switch width {
        case nil:
            stack.pinToSuperview(padding: 5)
        case .some(let widthButton):
            switch widthButton {
            case .small:
                widthAnchor ~= 164
            case .medium:
                widthAnchor ~= 231
            case .long:
                break
            }
            layer.cornerRadius = 10
            heightAnchor ~= 48
            stack.centerXAnchor ~= centerXAnchor
            stack.centerYAnchor ~= centerYAnchor
        }
        
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler()
                    print("press")
                }
            ),
            for: .touchUpInside
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setColor(background: UIColor? = nil, content: UIColor? = nil, highlighted: UIColor? = nil, border: UIColor? = nil, highlightedBorder: UIColor? = nil) {
        
        title.textColor = content
        image.tintColor = content
        
        if background != nil {
            backgroundColor = background
            
            addAction(.init(handler: { _ in
                self.backgroundColor = highlighted
                if highlightedBorder != nil {
                    self.layer.borderWidth = 1
                    self.layer.borderColor = highlightedBorder?.cgColor
                }
            }), for: .touchDown)
            addAction(.init(handler: { _ in
                self.backgroundColor = background
                if highlightedBorder != nil {
                    if border != nil {
                        self.layer.borderWidth = 1
                        self.layer.borderColor = border?.cgColor
                    }
                }
            }), for: .touchUpInside)
            addAction(.init(handler: { _ in
                self.backgroundColor = background
                if highlightedBorder != nil {
                    if border != nil {
                        self.layer.borderWidth = 1
                        self.layer.borderColor = border?.cgColor
                    }
                }
            }), for: .touchUpOutside)
        }
        else {
            addAction(.init(handler: { _ in
                self.title.isSelected = true
            }), for: .touchDown)
            addAction(.init(handler: { _ in
                self.title.isSelected = false
            }), for: .touchUpInside)
            addAction(.init(handler: { _ in
                self.title.isSelected = false
            }), for: .touchUpOutside)
        }
        
        if border != nil {
            layer.borderWidth = 1
            layer.borderColor = border?.cgColor
        }
    }
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
            
        switch colorButton {
        case .some(.first):
            break
        case .some(.second):
            layer.borderColor = UIColor.buttonBorder?.cgColor
        default:
            layer.borderColor = nil
        }
    }
}
