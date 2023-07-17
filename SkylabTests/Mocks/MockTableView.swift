//
//  MockTableView.swift
//  SkylabTests
//
//  Created by Aleksey Kotsevych on 17/07/2023.
//

import UIKit

class MockTableView: UITableView {
    
    var isReloaded = false
    
    override func reloadData() {
        
        isReloaded = true
    }
}
