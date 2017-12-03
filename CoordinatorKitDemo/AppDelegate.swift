//
//  AppDelegate.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 9/29/17.
//

import UIKit
import CoordinatorKit


// Now this is what an app delegate should look like
// Not polluted with anything that shouldn't be here
// Just set up your app, inject everything, and call start
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
    private let config: ConfigType = Config(bundle: .main, locale: .current)
    
    lazy var appStore: StoreType = Store(config: self.config)
	lazy var appNavigationController: UINavigationController = UINavigationController()
	lazy var appRouter: RouterType = Router(navigationController: self.appNavigationController)
    lazy var appCoordinator: AppCoordinator = AppCoordinator(router: self.appRouter, store: self.appStore)
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		// MARK: Window
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = appCoordinator.toPresentable()
		window?.backgroundColor = .white
		window?.makeKeyAndVisible()

        // or get notification from launch options and convert it to a deep link
        appCoordinator.start()
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {

	}

	func applicationDidEnterBackground(_ application: UIApplication) {
	
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
	
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
	
	}

	func applicationWillTerminate(_ application: UIApplication) {
	
	}
}

