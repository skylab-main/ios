//
//  KeychainManager.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 08/09/2023.
//

import Foundation

enum KeychainKey: String {
    case chatGptApiKey
}

class KeychainManager: KeychainManagerProtocol {
    
    func save(key: KeychainKey, data: String) {
        let data = data.data(using: .utf8)

        // Create a query to check if the item already exists
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
        ]

        // Check if the item exists
        if SecItemCopyMatching(query as CFDictionary, nil) == errSecSuccess {
            // Item exists, update it instead of deleting and adding
            let updateQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key.rawValue,
            ]

            let attributesToUpdate: [String: Any] = [
                kSecValueData as String: data!,
            ]

            let status = SecItemUpdate(updateQuery as CFDictionary, attributesToUpdate as CFDictionary)
            if status == errSecSuccess {
                print("Updated")
            } else {
                print("Failed to update: \(status)")
            }
        } else {
            // Item doesn't exist, add it
            let query: [String: AnyObject] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key.rawValue as AnyObject,
                kSecValueData as String: data as AnyObject,
            ]

            let status = SecItemAdd(query as CFDictionary, nil)
            if status == errSecSuccess {
                print("Saved")
            } else {
                print("Failed to save: \(status)")
            }
        }
    }
    
    func get(key: KeychainKey) -> Data? {
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne,
        ]
       
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        print(status)
        
        return result as? Data
    }
    
    func isKeyExists(key: KeychainKey) -> Bool {
        // Attempt to retrieve the data for the key from the Keychain
        if let _ = get(key: key) {
            // Data was successfully retrieved, so the key exists
            return true
        } else {
            // Data couldn't be retrieved, so the key doesn't exist
            return false
        }
    }
    
    func delete() {
        
        let secItemClasses = [kSecClassGenericPassword]
        
        for item in secItemClasses {
            let spec: NSDictionary = [kSecClass: item]
            SecItemDelete(spec)
        }
    }

}
