//
//  OnboardingViewModel.swift
//  Skylab
//
//  Created by Artem Bilyi on 16.02.2023.
//

import Foundation
import RxSwift
class OnboardingViewModel {

    var coordinatorDelegate: OnboardingCoordinatorDelegate?
    let featureToggleProvider:FeatureToggleProvider
    
    var didFetchValues = PublishSubject<Void>()
    
    init(featureToggleProvider:FeatureToggleProvider) {
        self.featureToggleProvider = featureToggleProvider
        fetchFeatureToggleValue()
    }

    func openAuthorizationController() {
        coordinatorDelegate?.openAuthorizationControllerDelegate()
    }
    
    func fetchFeatureToggleValue() {
        featureToggleProvider.fetchValues{ [weak self] in
            guard let self = self else{
                return
            }
            self.didFetchValues.onNext(())
            
         }
    }
}

protocol OnboardingCoordinatorDelegate {
    func openAuthorizationControllerDelegate()
}
