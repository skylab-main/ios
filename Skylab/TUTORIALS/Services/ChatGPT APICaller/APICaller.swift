//
//  APICaller.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 14/04/2023.
//

import Foundation
import OpenAISwift

final class APICaller {
    static let shared = APICaller()
    
    private let apiKey = "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"
    private var client: OpenAISwift?
    
    private init() {}
    
    public func setup() {
        self.client = OpenAISwift(authToken: apiKey)
    }
    
    public func getResponse(input: String, completion: @escaping (Result<String, Error>) -> Void) {
        client?.sendCompletion(with: input, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
                completion(.success(output))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
