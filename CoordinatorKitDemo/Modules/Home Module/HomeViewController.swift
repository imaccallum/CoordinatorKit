//
//  HomeViewController.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 12/1/17.
//

import UIKit

protocol HomeViewControllerDelegate: class {
	func controllerDidPressButton(_ controller: HomeViewController)
}

class HomeViewController: UIViewController {
	
	let button = UIButton()
	weak var delegate: HomeViewControllerDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .green
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Tap to push horizontal flow", for: .normal)
		
		button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
		button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
		button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
		
		button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
	}
	
	@objc func didPressButton(_ sender: UIButton) {
		delegate?.controllerDidPressButton(self)
	}
	
	
}
