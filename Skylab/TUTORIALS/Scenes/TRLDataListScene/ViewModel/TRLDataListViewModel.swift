//
//  TRLDataListViewModel.swift
//  Skylab
//
//  Created by Liza on 19.04.2023.
//

import Foundation

class TRLDataListViewModel {
    
    private let topics: [TRLDataListTopic] = [
        TRLDataListTopic(title: "Topic 1", progressValue: 0.3),
        TRLDataListTopic(title: "Topic 2", progressValue: 0.9),
        TRLDataListTopic(title: "Topic 3", progressValue: 0.1),
        TRLDataListTopic(title: "Topic 4", progressValue: 0.5),
        TRLDataListTopic(title: "Topic 5", progressValue: 1.0)
    ]
    
    var titles: [String]
    var progressValues: [Float]
    
    let imageName: String = "puzzle"
    
    init(){
        
        titles = topics.reduce(into: [String]() ){ result, item in
            result.append(item.title)
            
        }
        progressValues = topics.reduce(into: [Float]() ){ result, item in
            result.append(item.progressValue)
            
        }
        
        
    }
    
}


struct TRLDataListTopic {
    
    let title:String
    let progressValue:Float
    
}
