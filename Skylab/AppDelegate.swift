//
//  AppDelegate.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 27.11.2022.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

     func application(_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

         FirebaseApp.configure()
         window = UIWindow(frame: UIScreen.main.bounds)
         appCoordinator = AppCoordinator(window: window)
         appCoordinator.start()
         return true
     }
}

// MARK: Authors

// Alex. Git: alexdneprin
// Serhii. Git: dorogobid
// Serhii. Git: SerhiiMolodets
// Artem Bilyy: artembilyy
// Vasilii. Git: vasiario
// Artem Tkachenko. Git: tk4chenko
// Misha. Git: ZhutovMisha
// Liza. Git: Liizza
// Mikhail. Git: slepom
// Roman Golub. Git: glbrom
// Stanislav Burian. Git: 4050
// Oleksii Kotsevych. Git: Hyper-ON3
