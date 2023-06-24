//
//  CourseDetailsViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 01/06/2023.
//

import Foundation

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    
    //Temporary data for the menu
    var tutorialMenuData: [CourseDetailsModel] = [
        CourseDetailsModel(isExpanded: false, title: "Learning Swift", data: ["One", "Two", "Three", "Four"]),
        CourseDetailsModel(isExpanded: false, title: "Git", data: ["One", "Two", "Three", "Four"]),
        CourseDetailsModel(isExpanded: false, title: "User Interface (UIKit)", data: ["One", "Two", "Three", "Four"]),
        CourseDetailsModel(isExpanded: false, title: "Data layer in IOS Applications",
                           data: ["Clien-server application", "Rest API, Postman", "JSON Parsing", "Rest request in IOS application",
                                  "Alamofire", "Error handling", "Data storages: UserDefaults", "Realm (+Facade)"]),
        CourseDetailsModel(isExpanded: false, title: "Multitheading", data: ["One", "Two", "Three", "Four"]),
        CourseDetailsModel(isExpanded: false, title: "Code style", data: ["One", "Two", "Three", "Four"]),
        CourseDetailsModel(isExpanded: false, title: "Additional Topics", data: ["One", "Two", "Three", "Four"]),
    ]
}
