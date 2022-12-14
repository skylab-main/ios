//
//  AppDelegate.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 27.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

// MARK: Authors

// Alex. Git: alexdneprin
// ..

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
