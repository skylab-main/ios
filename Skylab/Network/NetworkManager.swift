//
//  NetworkManager.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 18/06/2023.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func getQuiz(completion: @escaping (_ quizData: [Quiz]) -> ())
}

class NetworkManager: NetworkManagerProtocol {
    
    func getQuiz(completion: @escaping (_ quizData: [Quiz]) -> ()) {
        
        guard let url = Bundle.main.url(forResource: "Quizz", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let quizData = try decoder.decode(QuizData.self, from: data)
            completion(quizData.quiz)
        } catch {
            
            print(error)
        }
    }
    
}
