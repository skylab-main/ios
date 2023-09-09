//
//  ResultCheckViewModel.swift
//  Skylab
//
//  Created by Сергей Молодец on 31.07.2023.
//

import Foundation
import RxSwift

class ResultCheckViewModel: ResultCheckViewModelProtocol {
    var openResultCheckController = PublishSubject<String>()
    var openApiManualDoc = PublishSubject<Void>()
    var goToVideoScene = PublishSubject<Void>()
    var solutionData: [String : String]!
    
    weak var keychainManager: KeychainManagerProtocol?
    
    init(keychainManager: KeychainManagerProtocol? = nil) {
        self.keychainManager = keychainManager
    }
    
    func saveApi(key: String) {
        guard let keychainManager else { return }
    
        keychainManager.save(key: .chatGptApiKey, data: key)
    }
}
