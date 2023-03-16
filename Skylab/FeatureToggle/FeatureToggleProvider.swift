//
//  FeatureToggleProvider.swift
//  Skylab
//
//  Created by Liza on 16.03.2023.
//

import Foundation
import FirebaseRemoteConfig

enum Feature:String,CaseIterable{
    case toggleLabel
}

protocol FeatureToggleProvider {
    func isEnabled(_ feature:Feature)->Bool
    func fetchValues(_ completion:@escaping ()->Void)
}

class FirebaseFeatureToggleProvider: FeatureToggleProvider {
    
    static let shared = FirebaseFeatureToggleProvider()
    private var appDefaults:[String:Bool] = [Feature.toggleLabel.rawValue : false]
        
    private let remoteConfig = RemoteConfig.remoteConfig()
    private init(){
        setDefaultValues()
    }
    private func setDefaultValues(){
        for feature in Feature.allCases{
            if appDefaults[feature.rawValue] == nil {
                appDefaults[feature.rawValue] = false
            }
            
        }
        remoteConfig.setDefaults(appDefaults as [String : NSObject])
        
    }
    func isEnabled(_ feature:Feature)->Bool{
        let configValue = remoteConfig.configValue(forKey:feature.rawValue ).boolValue
        return configValue
    }
    private func activateDeveloperMode(){
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    func fetchValues(_ completion: @escaping () -> Void) {
        activateDeveloperMode()
        remoteConfig.fetchAndActivate(){ _,error in
            if let error = error {
                print(error)
                completion()
                return
            }
            print("Fetched and activated")
            completion()
            
            
        }
            
    }

}
