import UIKit

public protocol BaseCoordinatorType: class {
	associatedtype DeepLinkType
	func start()
	func start(with link: DeepLinkType?)
}

public protocol PresentableCoordinatorType: BaseCoordinatorType, Presentable {}

open class PresentableCoordinator<DeepLinkType>: NSObject, PresentableCoordinatorType {
	
	public override init() {
		super.init()
	}
	
	open func start() { start(with: nil) }
	open func start(with link: DeepLinkType?) {}

	open func toPresentable() -> UIViewController {
		fatalError("Must override toPresentable()")
	}
}


public protocol CoordinatorType: PresentableCoordinatorType {
	var router: RouterType { get }
}


open class Coordinator<DeepLinkType>: PresentableCoordinator<DeepLinkType>, CoordinatorType  {
	
	public var childCoordinators: [Coordinator<DeepLinkType>] = []
	
	open var router: RouterType
	
	public init(router: RouterType) {
		self.router = router
		super.init()
	}
	
	public func addChild(_ coordinator: Coordinator<DeepLinkType>) {
		childCoordinators.append(coordinator)
	}
	
	public func removeChild(_ coordinator: Coordinator<DeepLinkType>?) {
		
		if let coordinator = coordinator, let index = childCoordinators.index(of: coordinator) {
			childCoordinators.remove(at: index)
		}
	}
    
    open override func toPresentable() -> UIViewController {
        return router.toPresentable()
    }
}
