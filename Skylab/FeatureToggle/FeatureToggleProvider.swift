//
//  FeatureToggleProvider.swift
//  Skylab
//
//  Created by Liza on 16.03.2023.
//

import Foundation
import FirebaseRemoteConfig

protocol FeatureToggleProvider {
    func isEnabled(_ feature:Feature) -> Bool
    func fetchValues(_ completion:@escaping () -> Void)
}

class FirebaseFeatureToggleProvider: FeatureToggleProvider {
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    init() {
        setDefaultValues()
    }
    
    private func setDefaultValues() {
        let features = Feature.allCases
        let appDefaults = features.reduce(into: [String:Bool]() ) { result, feature in
            result[feature.rawValue] = feature.isEnabled
            
        }
        remoteConfig.setDefaults(appDefaults as [String : NSObject])
        
    }
    func isEnabled(_ feature:Feature) -> Bool {
        let configValue = remoteConfig.configValue(forKey:feature.rawValue ).boolValue
        return configValue
    }
    private func activateDeveloperMode() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    func fetchValues(_ completion: @escaping () -> Void) {
        activateDeveloperMode()
        remoteConfig.fetchAndActivate() { _,error in
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
