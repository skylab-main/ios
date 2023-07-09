//
//  LessonsVideoViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 06.07.2023.
//

import UIKit
import YouTubeiOSPlayerHelper

class LessonsVideoViewController: UIViewController, Storyboarded, YTPlayerViewDelegate {
    @IBOutlet weak var videoContainerView: UIView!
    @IBOutlet weak var videoView: YTPlayerView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var telegramButton: UIButton!
    @IBOutlet weak var lessonThemeLabel: UILabel!
    var viewModel: VideoViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadVideo()
    }
    
    private func configureUI() {
        videoContainerView.layer.borderWidth = 1
        videoContainerView.layer.borderColor = UIColor.primary.cgColor
        videoContainerView.layer.cornerRadius = 12
        videoContainerView.clipsToBounds = true
        videoView.layer.cornerRadius = 6
        videoView.clipsToBounds =  true
        lessonThemeLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        lessonThemeLabel.text = viewModel?.title
        downloadButton.configureButton(title: "Скачати презентацію", imageName: nil,
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
        telegramButton.configureButton(title: "Telegram канал з матеріалами ", imageName: nil,
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
    }
    
    private func loadVideo() {
        videoView.delegate = self
        if let id = viewModel?.videoID {
            videoView.load(withVideoId: id)
        }
    }
    
    
}
