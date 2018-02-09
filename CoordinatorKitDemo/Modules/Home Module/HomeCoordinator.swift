//
//  HomeCoordinator.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 11/30/17.
//

import Foundation
import CoordinatorKit

class HomeCoordinator: Coordinator<DeepLink> {
	
	private let store: StoreType
	
	lazy var homeViewController: HomeViewController = {
		let controller = HomeViewController()
		controller.delegate = self
		return controller
	}()
	
	init(navigator: NavigatorType, store: StoreType) {
		self.store = store
		super.init(navigator: navigator)
		navigator.setRootModule(homeViewController, hideBar: false)
	}
}

extension HomeCoordinator: HomeViewControllerDelegate {
	func controllerDidPressButton(_ controller: HomeViewController) {
		
		let coordinator = ProfileCoordinator(navigator: navigator, store: store)
		
		// Maintain a strong reference to avoid deallocation
		addChild(coordinator)
		coordinator.start()
		
		// Avoid retain cycles and don't forget to remove the child when popped
		navigator.push(coordinator, animated: true) { [weak self, weak coordinator] in
			self?.removeChild(coordinator)
			print("Pooped!")
		}
	}
}
