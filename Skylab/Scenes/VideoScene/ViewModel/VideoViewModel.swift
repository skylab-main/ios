//
//  VideoViewModel.swift
//  Skylab
//
//  Created by Сергей Молодец on 09.07.2023.
//


import RxSwift
import Foundation

class VideoViewModel: VideoViewModelProtocol {
    var downloadPresentation = PublishSubject<Void>()
    var joinTelegram = PublishSubject<Void>()
    
    //    Sample data
    var title = "Simple animations: element position, color, size."
    var videoID = "2Nd3yDsZ7AI"
    var linkPresentation: URL? { return URL(string: "https://drive.google.com/u/0/uc?id=1yI-7wmY1bAJSjOizloeidef0Ci_ccXDc&export=download")  }
    var task = "Задача: Написати функцію на мові Swift для вирахування середнього арифметичного значення двох чисел."
    var isTaskDone = false
    var telegramLink = URL(string: "https://t.me/skylab_task")
    
    func markIsDone() {
        UserDefaults.standard.set(true, forKey: title)
    }
    
    func checkTaskIsDone() -> Bool {
        return UserDefaults.standard.bool(forKey: title)
    }
}
// Where we will save it? isTaskDone and what key shoud we use
// How to check progress ?
