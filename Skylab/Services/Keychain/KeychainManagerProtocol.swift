//
//  KeychainManagerProtocol.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 08/09/2023.
//

import Foundation

protocol KeychainManagerProtocol: AnyObject {
    func save(key: KeychainKey, data: String)
    func get(key: KeychainKey) -> Data?
    func isKeyExists(key: KeychainKey) -> Bool
    func delete()
}
