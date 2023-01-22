//
//  BaseViewController.swift
//  Skylab
//
//  Created by Oleksandr Slobodianiuk on 18.12.2022.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Constructors
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        debugPrint("[init]: \(self)")
    }

    // MARK: Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("[viewDidLoad]: \(self)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugPrint("[viewWillAppear]: \(self)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugPrint("[viewDidAppear]: \(self)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        debugPrint("[viewWillDisappear]: \(self)")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        debugPrint("[viewDidDisappear]: \(self)")
    }

}
