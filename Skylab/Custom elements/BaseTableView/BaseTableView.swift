//
//  BaseTableView.swift
//  Skylab
//
//  Created by Леонід Квіт on 10.06.2023.
//

import UIKit

class BaseTableView: UIView {
    
    private let tableView: UITableView
    var viewModel: BaseTableViewModel?
    
    init(frame: CGRect, viewModel: BaseTableViewModel?) {
        self.tableView = UITableView(frame: frame, style: .plain)
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        configureTableView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        //tableView.backgroundColor = .primary
        tableView.layer.cornerRadius = 15
        tableView.clipsToBounds = true
        tableView.rowHeight = 150 //UITableView.automaticDimension
//        tableView.estimatedRowHeight = 150
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "BaseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BaseTableViewCell")
        
        tableView.separatorStyle = .none
    }
    
    private func setupConstraints() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension BaseTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell", for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
        
        let title = viewModel?.itemsArray[indexPath.row].0 ?? "No data"
        let progressValues = viewModel?.itemsArray[indexPath.row].1 ?? 0
        cell.updateCell(title: title, progressValues: progressValues)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let item = viewModel?.itemsArray[indexPath.row].0 ?? "No data"
        print(item)
        //        viewModel?.openLevelViewController(item)
    }
}
