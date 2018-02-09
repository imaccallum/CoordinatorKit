//
//  WindowNavigator.swift
//  CoordinatorKit
//
//  Created by Ian MacCallum on 10/11/17.
//

import UIKit
import SafariServices

public protocol WindowNavigatorType: class {
	var window: UIWindow { get }
	init(window: UIWindow)
	func setRootModule(_ module: Presentable)
}


final public class WindowNavigator: NSObject, WindowNavigatorType {
	
	public unowned let window: UIWindow
	
	public init(window: UIWindow) {
		self.window = window
		super.init()
	}
	
	public func setRootModule(_ module: Presentable) {
		let viewController = module.toPresentable()
		window.rootViewController = viewController
	}
}
