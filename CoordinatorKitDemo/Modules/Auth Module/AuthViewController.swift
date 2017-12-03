//
//  AuthViewController.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 11/1/17.
//

import Foundation
import UIKit

protocol AuthViewControllerDelegate: class {
	func controllerDidPressCancelButton(_ controller: AuthViewController)
	func controllerDidPressLoginButton(_ controller: AuthViewController)
    func controllerDidPressSignupButton(_ controller: AuthViewController)
}

class AuthViewController: UIViewController {
    
    weak var delegate: AuthViewControllerDelegate?

    let loginButton = UIButton()
    let signupButton = UIButton()
	let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    
    let spacing: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = .white
		
		navigationItem.leftBarButtonItem = cancelButton
        
        loginButton.setTitle("Login", for: .normal)
        signupButton.setTitle("Sign Up", for: .normal)
        
        loginButton.backgroundColor = .magenta
        signupButton.backgroundColor = .green
        
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addConstraints([
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacing),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
            signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: spacing),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing)
        ])
		
		cancelButton.target = self
		cancelButton.action = #selector(didPressCancelButton(_:))
        loginButton.addTarget(self, action: #selector(didPressLoginButton(_:)), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(didPressSignupButton(_:)), for: .touchUpInside)
    }
	
	@objc func didPressCancelButton(_ button: UIBarButtonItem) {
		delegate?.controllerDidPressCancelButton(self)
	}

    @objc func didPressLoginButton(_ button: UIButton) {
        delegate?.controllerDidPressLoginButton(self)
    }
	
    @objc func didPressSignupButton(_ button: UIButton) {
        delegate?.controllerDidPressSignupButton(self)
    }
}
