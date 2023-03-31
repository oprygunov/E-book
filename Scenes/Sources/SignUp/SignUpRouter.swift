//
//  SignUpRouter.swift
//  E-book
//
//  Created by Oleg Prygunov on 27.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class SignUpRouter {
    weak var viewController: SignUpViewController?
    var dataStore: SignUpDataStore?

    init(viewController: SignUpViewController, dataStore: SignUpDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension SignUpRouter: SignUpRoutingLogic {
    func continueWithApple() {
        
    }
    
    func continueWithGoogle() {
        
    }
    
    func createAccount() {
        viewController?.navigationController?.pushViewController(CreateAccountBuilder.build(), animated: true)
    }
    
    func termsOfUse() {
        
    }
    
    func privacyPolicy() {
        
    }
    
    func enterAccount() {
        
    }
}
