//
//  TRLMenuViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/04/2023.
//

import Foundation

protocol TRLMenuViewModelProtocol {
    
    var tutorialMenuData: [TRLMenuModel] { get set }
}

class TRLMenuViewModel: TRLMenuViewModelProtocol {
    
    private var data = [
        "Clien-server application", "Rest API, Postman", "JSON Parsing", "Rest request in IOS application",
        "Alamofire", "Error handling", "Data storages: UserDefaults", "Realm (+Facade)"
    ]
    
    var tutorialMenuData: [TRLMenuModel] = [
        TRLMenuModel(isExpanded: true, title: "Learning Swift", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: true, title: "Git", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: true, title: "User Interface (UIKit)", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: true, title: "Data in IOS Applications", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: true, title: "Multitheading", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: true, title: "Code style", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: true, title: "Additional Topics", data: ["One", "Two", "Three", "Four"]),
    ]
}
