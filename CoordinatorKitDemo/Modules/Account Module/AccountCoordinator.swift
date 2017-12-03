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
	
	init(router: RouterType, store: StoreType) {
		self.store = store
		super.init(router: router)
		accountViewController.view.backgroundColor = .magenta
		router.setRootModule(accountViewController, hideBar: false)
	}
}
