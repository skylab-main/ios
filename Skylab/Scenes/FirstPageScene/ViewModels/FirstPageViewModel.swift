//
//  FirstPageViewModel.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 07.01.2023.
//

import Foundation
import RxSwift
import RxRelay

class FirstPageViewModel {
    
    // MARK: - Inputs
    let openFirstSubController: AnyObserver<Void>
    let openSecondSubController: AnyObserver<Void>
    
    // MARK: - Outputs
    let didOpenFirstSubController: Observable<Void>
    let didOpenSecondSubController: Observable<Void>
    
    let featureToggleProvider:FeatureToggleProvider
    let toggleLabelIsHidden = BehaviorRelay<Bool>(value:true)
    
    init(featureToggleProvider:FeatureToggleProvider) {
        self.featureToggleProvider = featureToggleProvider
        // Connection between input and output
        let openFirstSubControllerRX = PublishSubject<Void>()
        self.openFirstSubController = openFirstSubControllerRX.asObserver()
        self.didOpenFirstSubController = openFirstSubControllerRX.asObservable()
        
        let openSecondSubControllerRX = PublishSubject<Void>()
        self.openSecondSubController = openSecondSubControllerRX.asObserver()
        self.didOpenSecondSubController = openSecondSubControllerRX.asObservable()
        
        setFeatures()
    }
    func setFeatures() {
        if featureToggleProvider.isEnabled(.toggleLabel) {
            toggleLabelIsHidden.accept(false)
        } else {
            toggleLabelIsHidden.accept(true)
        }
    }
    

}

