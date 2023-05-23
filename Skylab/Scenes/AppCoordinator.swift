//
//  AppCoordinator.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 04.01.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow
    let featureToggleProvider = FirebaseFeatureToggleProvider()
    // MARK: - Coordinator
    
    init(window: UIWindow?) {
        guard let window = window else {
            fatalError("There is no window for AppCoordinator")
        }
        self.window = window
    }
   
    override func start() {
        
        window.makeKeyAndVisible()
        
        // Here we choose what is going to be open, depending on data we have
        
        /// Local 'if' executed when the application is launched from the 'release' schema
        #if LOCAL
        testScrollableMenuView()
//        openAuthorization()
//          openOnboarding()
        openMainTabBar()
//        openSwinjectTutorial()
        
        /// Dev 'if' executed when the application is launched from the 'debug' schema
        #elseif DEV
        openMainMenu()
//        openTabBar()
        #endif
    }
    
    func openMainTabBar() {
        let tabBarCoordinator = MainTabBarCoordinator(MainTabBarViewController())
        window.rootViewController = tabBarCoordinator.rootTabBarController
        tabBarCoordinator.start()
        addChildCoordinator(tabBarCoordinator)
    }
    
    func openOnboarding() {
        let coordinator = OnboardingCoordinator(UINavigationController(), parentCoordinatoor: self, featureToggleProvider: featureToggleProvider)
        coordinator.start()
        window.rootViewController = coordinator.rootController
        addChildCoordinator(coordinator)
    }
    
    func openAuthorization() {
        let coordinator = AuthorizationCoordinator(UINavigationController())
        coordinator.start()
        window.rootViewController = coordinator.rootController
        addChildCoordinator(coordinator)
    }
    
    func openTabBar() {
        let tabBarCoordinator = TabBarCoordinator(TabBarController(), featureToggleProvider: featureToggleProvider)
        window.rootViewController = tabBarCoordinator.rootTabBarController
        tabBarCoordinator.start()
        addChildCoordinator(tabBarCoordinator)
    }
    
    func testScrollableMenuView() {
        let coordinator = TestMenuViewCoordinator(UINavigationController())
        coordinator.start()
        window.rootViewController = coordinator.rootController
        addChildCoordinator(coordinator)
    }
        
    func openSwinjectTutorial() {
        let coordinator = SwinjectTestPageCoordinator(UINavigationController())
        coordinator.start()
        window.rootViewController = coordinator.rootController
        addChildCoordinator(coordinator)
    }
    
    func openMainMenu() {
        let coordinator = MainMenuCoordinator(UINavigationController(), parentCoordinatoor: self, featureToggleProvider: featureToggleProvider)
        coordinator.start()
        window.rootViewController = coordinator.rootController
        addChildCoordinator(coordinator)
    }
    
    override func finish() { }
}
