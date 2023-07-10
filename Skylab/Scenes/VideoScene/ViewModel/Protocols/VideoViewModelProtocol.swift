//
//  VideoViewModelProtocol.swift
//  Skylab
//
//  Created by Сергей Молодец on 09.07.2023.
//

import RxSwift
import Foundation

protocol VideoViewModelProtocol: AnyObject {
    var downloadPresentation: PublishSubject<Void> { get set }
    var joinTelegram: PublishSubject<Void> { get set }
    var title: String { get }
    var videoID: String { get }
    var linkPresentation: URL? { get }
    var task: String { get }
    var telegramLink: URL? { get }
    
    func markTask()
    
    func checkTaskIsDone() -> Bool
}
