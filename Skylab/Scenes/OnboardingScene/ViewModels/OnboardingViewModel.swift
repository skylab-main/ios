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
    private let firebaseProvider = FirebaseFeatureToggleProvider.shared
    
    var didFetchValues = PublishSubject<Void>()
    
    init(){
        
        fetchFeatureToggleValue()
    }

    func openAuthorizationController() {
        coordinatorDelegate?.openAuthorizationControllerDelegate()
    }
    
    func fetchFeatureToggleValue(){
        firebaseProvider.fetchValues{ [weak self] in
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
