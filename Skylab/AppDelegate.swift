//
//  AppDelegate.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 27.11.2022.
//


import UIKit
import FirebaseCore
import CrowdinSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

     func application(_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

         FirebaseApp.configure()
         setupCrowdin()
         window = UIWindow(frame: UIScreen.main.bounds)
         appCoordinator = AppCoordinator(window: window)
         appCoordinator.start()
         return true
     }
    
    //   Added for localisation
    func setupCrowdin() {
            let crowdinProvider = CrowdinProviderConfig(hashString: "adc8f4c0cc6d758f50881f9eh8h", sourceLanguage: "ua")
            let config = CrowdinSDKConfig.config().with(crowdinProviderConfig: crowdinProvider)
            
            CrowdinSDK.startWithConfig(config) {
                print("helloWorld".cw_localized)
            }
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
