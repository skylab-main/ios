//
//  TRLDataListViewController.swift
//  Skylab
//
//  Created by Liza on 19.04.2023.
//

import UIKit

class TRLDataListViewController: BaseViewController, Storyboarded {

    @IBOutlet weak var dataList: DataList!
    
    var viewModel: TRLDataListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataList.configure(titles: viewModel?.titles ?? [], progressValues: viewModel?.progressValues)
        //dataList.configure(titles: viewModel?.titles ?? [], imageName: viewModel?.imageName)
        dataList.delegate = self

    }
    
    
    

}

extension TRLDataListViewController: DataListDelegate {
    func elementPressed(_ index: Int) {
        print("\(viewModel?.titles[index] ?? "") element pressed")
    }
    
    
}
