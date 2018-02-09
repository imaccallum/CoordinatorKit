//
//  WindowCoordinator.swift
//  CoordinatorKit
//
//  Created by Ian MacCallum on 10/11/17.
//

public protocol WindowCoordinatorType: BaseCoordinatorType {
	var navigator: WindowNavigatorType { get }
}

open class WindowCoordinator<DeepLinkType>: NSObject, WindowCoordinatorType {
	
	public var childCoordinators: [PresentableCoordinator<DeepLinkType>] = []
	
	open var navigator: WindowNavigatorType
	
	public init(navigator: WindowNavigatorType) {
		self.navigator = navigator
		super.init()
	}
	
	open func start() { start(with: nil) }
	open func start(with link: DeepLinkType?) {}
	
	public func addChild(_ coordinator: Coordinator<DeepLinkType>) {
		childCoordinators.append(coordinator)
	}
	
	public func removeChild(_ coordinator: Coordinator<DeepLinkType>?) {
		
		if let coordinator = coordinator, let index = childCoordinators.index(of: coordinator) {
			childCoordinators.remove(at: index)
		}
	}
}
