//
//  TRLMenuViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 21/04/2023.
//

import Foundation

class TRLMenuViewModel: TRLMenuViewModelProtocol {
    
    //Temporary data for the menu 
    var tutorialMenuData: [TRLMenuModel] = [
        TRLMenuModel(isExpanded: false, title: "Learning Swift", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: false, title: "Git", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: false, title: "User Interface (UIKit)", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: false, title: "Data layer in IOS Applications",
                     data: ["Clien-server application", "Rest API, Postman", "JSON Parsing", "Rest request in IOS application",
                            "Alamofire", "Error handling", "Data storages: UserDefaults", "Realm (+Facade)"]),
        TRLMenuModel(isExpanded: false, title: "Multitheading", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: false, title: "Code style", data: ["One", "Two", "Three", "Four"]),
        TRLMenuModel(isExpanded: false, title: "Additional Topics", data: ["One", "Two", "Three", "Four"]),
    ]
}
