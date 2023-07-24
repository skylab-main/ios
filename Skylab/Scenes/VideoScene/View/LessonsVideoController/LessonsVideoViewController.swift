//
//  LessonsVideoViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 06.07.2023.
//

import UIKit
import RxSwift
import RxCocoa
import YouTubeiOSPlayerHelper


class LessonsVideoViewController: BaseViewController, Storyboarded, YTPlayerViewDelegate {
   
    // MARK: - IBOutlets
    @IBOutlet weak var videoContainerView: UIView!
    @IBOutlet weak var videoView: YTPlayerView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var telegramButton: UIButton!
    @IBOutlet weak var lessonThemeLabel: UILabel!
    
    // MARK: - let/var
    var viewModel: VideoViewModelProtocol?
    
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadVideo()
        bindToViewModel()
    }
    
    // MARK: - UI Configurations funcs
    private func configureUI() {
        videoContainerView.layer.borderWidth = 1
        videoContainerView.layer.borderColor = UIColor.primary.cgColor
        videoContainerView.layer.cornerRadius = 12
        videoContainerView.clipsToBounds = true
        videoView.layer.cornerRadius = 6
        videoView.clipsToBounds =  true
        lessonThemeLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 18, textColor: .primary, nil)
        lessonThemeLabel.text = viewModel?.title
        downloadButton.configureButton(title: NSLocalizedString("LessonsVideoViewController.downloadButton.title", comment: "title for downloadButton on the lessons video screen"), imageName: nil,
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
        telegramButton.configureButton(title: NSLocalizedString("LessonsVideoViewController.telegramButton.title", comment: "title for telegram channel button"), imageName: nil,
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Flow funcs
    private func loadVideo() {
        videoView.delegate = self
        if let id = viewModel?.videoID {
            videoView.load(withVideoId: id)
        }
    }
    
    // MARK: - Binding funcs
    private func bindToViewModel() {
        guard let viewModel else { return }
        downloadButton.rx.tap
            .bind(to: viewModel.downloadPresentation)
            .disposed(by: bag)
        telegramButton.rx.tap
            .bind(to: viewModel.joinTelegram)
            .disposed(by: bag)
    }
}
