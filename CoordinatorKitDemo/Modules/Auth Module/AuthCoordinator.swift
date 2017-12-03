//
//  AuthCoordinator.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 10/11/17.
//

import UIKit
import CoordinatorKit

// This entire module is reusable and presentable from anywhere
// All you need is a router
class AuthCoordinator: Coordinator<DeepLink> {
	
    let authViewController = AuthViewController()
	
	var onCancel: (() -> Void)?
    var onAuthenticated: ((String) -> ())?
    
    override init(router: RouterType) {
        super.init(router: router)
        router.setRootModule(authViewController, hideBar: false)
        authViewController.delegate = self
    }
	
    override func start(with link: DeepLink?) {
		
	}
}


extension AuthCoordinator: AuthViewControllerDelegate {
	
	func controllerDidPressCancelButton(_ controller: AuthViewController) {
		onCancel?()
	}
    
    func controllerDidPressLoginButton(_ controller: AuthViewController) {
		// Would actually push to a login module
        onAuthenticated?("TokenFromLogin")
    }
    
    func controllerDidPressSignupButton(_ controller: AuthViewController) {
		// Would actually push to a signup module
        onAuthenticated?("TokenFromSignup")
    }
}
