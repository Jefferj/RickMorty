//
//  RMLocationView.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 2/02/23.
//

import UIKit

final class RMLocationView: UIView {
    
    private var viewModel: RMLocationViewViewModel? {
        didSet {
            spinner.stopAnimating()
            tableView.isHidden = false
            tableView.reloadData()
            UIView.animate(withDuration: 0.3) {
                self.tableView.alpha = 1
            }
        }
    }
    
    private let tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        aTable.alpha = 0
        aTable.isHidden = true
        return aTable
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let aSpinner = UIActivityIndicatorView()
        aSpinner.translatesAutoresizingMaskIntoConstraints = false
        aSpinner.hidesWhenStopped = true
        return aSpinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(tableView, spinner)
        spinner.startAnimating()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func configure(with viewModel: RMLocationViewViewModel) {
        self.viewModel = viewModel
    }
}
