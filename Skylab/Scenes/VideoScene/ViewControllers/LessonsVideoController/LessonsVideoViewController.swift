//
//  LessonsVideoViewController.swift
//  Skylab
//
//  Created by Сергей Молодец on 06.07.2023.
//

import UIKit

class LessonsVideoViewController: UIViewController, Storyboarded {
    @IBOutlet weak var videoContainerView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var telegramButton: UIButton!
    @IBOutlet weak var lessonThemeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        videoContainerView.layer.borderWidth = 1
        videoContainerView.layer.borderColor = UIColor.primary.cgColor
        videoContainerView.layer.cornerRadius = 12
        videoContainerView.clipsToBounds = true
        lessonThemeLabel.configureCustomLabel(font: .anonymousProBold, fontSize: 14, textColor: .primary, nil)
        
        downloadButton.configureButton(title: "Скачати презентацію", imageName: nil,
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
        telegramButton.configureButton(title: "Telegram канал з матеріалами ", imageName: nil,
                                       fontName: CustomFonts.anonymousProBold.rawValue,
                                       fontSize: 14,
                                       tintColor: .primary)
    }
 

}
