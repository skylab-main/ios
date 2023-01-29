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

         openAuthorization()
//         openOnboarding()
//        openTabBar()
//        openSwinjectTutorial()
    }

    func openOnboarding() {
        let coordinator = OnboardingCoordinator(UINavigationController())
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
        let tabBarCoordinator = MainTabBarCoordinator(MainTabBarController())
        window.rootViewController = tabBarCoordinator.rootTabBarController
        tabBarCoordinator.start()
        addChildCoordinator(tabBarCoordinator)
    }
    
    func openSwinjectTutorial() {
        let coordinator = SwinjectTestPageCoordinator(UINavigationController())
        coordinator.start()
        window.rootViewController = coordinator.rootController
        addChildCoordinator(coordinator)
    }

    override func finish() { }
}
