import UIKit

protocol Coordinatable {
    associatedtype NavigatorType
}

open class Coordinator: NSObject, Presentable {
    
    public var childCoordinators: [Coordinator<ChildViewType>] = []
    public weak var parent: Coordinator<ViewType>?
    
    open var navigator: Navigator
    
    public init(navigator: Navigator) {
        self.navigator = navigator
        super.init()
    }
    
    public func addChild(_ coordinator: Coordinator<LinkType, ActionType>) {
        childCoordinators.append(coordinator)
        coordinator.parent = self
        coordinator.activate()
    }
    
    public func removeChild(_ coordinator: Coordinator<LinkType, ActionType>?) {
        
        if let coordinator = coordinator, let index = childCoordinators.index(of: coordinator) {
            coordinator.parent = nil
            childCoordinators.remove(at: index)
            coordinator.deactivate()
        }
    }
    

    // Active
    
    public func activate() {
        didActivate()
    }
    
    public func deactivate() {
        didDeactivate()
    }
    
    open func didActivate() {
        
    }
    
    open func didDeactivate() {
        
    }
    
    // MARK: Presentable
    
    open func toPresentable() -> UIViewController {
        return navigator.toPresentable()
    }
}





