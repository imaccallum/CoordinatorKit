//
//  ProfileCoordinator.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 12/1/17.
//

import Foundation
import CoordinatorKit

// This is a horizontal flow

class ProfileCoordinator: Coordinator<DeepLink> {
	
	let viewController = UIViewController()
	private let store: StoreType
	
	init(router: RouterType, store: StoreType) {
		self.store = store
		super.init(router: router)
		viewController.view.backgroundColor = .blue
	}
	
	// We must override toPresentable() so it doesn't
	// default to the router's navigationController
	override func toPresentable() -> UIViewController {
		return viewController
	}
}
