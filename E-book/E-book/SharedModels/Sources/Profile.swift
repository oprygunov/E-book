//
//  LoginTextFieldView.swift
//  E-book
//
//  Created by Vadim Mukhin on 22.03.2023.
//

import Foundation

public struct UserProfile {
    public let name: String
    public let email: String
    public let password: String
    public let userPhoto: String

    public init(
        name: String,
        email: String,
        password: String,
        userPhoto: String) {
            self.name = name
            self.email = email
            self.password = password
            self.userPhoto = userPhoto
        }
}

public class SharedProfile {
    public static var shared = SharedProfile()

    public var profile: UserProfile?

    private init() {}
}
