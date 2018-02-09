//
//  AccountCoordinator.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 11/30/17.
//

import Foundation
import CoordinatorKit

class AccountCoordinator: Coordinator<DeepLink> {
	
	private let store: StoreType
	
	let accountViewController = UIViewController()
	
	init(navigator: NavigatorType, store: StoreType) {
		self.store = store
		super.init(navigator: navigator)
		accountViewController.view.backgroundColor = .magenta
		navigator.setRootModule(accountViewController, hideBar: false)
	}
}
