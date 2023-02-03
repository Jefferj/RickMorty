//
//  RMNoSearchResultsView.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 3/02/23.
//

import UIKit

final class RMNoSearchResultsView: UIView {
    
    private let viewModel = RMNoSearchResultsViewViewModel()
    
    private let iconView: UIImageView = {
        let aIcon = UIImageView()
        aIcon.contentMode = .scaleAspectFit
        aIcon.tintColor = .systemBlue
        aIcon.translatesAutoresizingMaskIntoConstraints = false
        return aIcon
    }()
    
    private let label: UILabel = {
        let aLabel = UILabel()
        aLabel.textAlignment = .center
        aLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        return aLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(iconView, label)
        addConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 90),
            iconView.heightAnchor.constraint(equalToConstant: 90),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            label.leftAnchor.constraint(equalTo: leftAnchor),
            label.rightAnchor.constraint(equalTo: rightAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
        ])
    }
    
    private func configure() {
        label.text = viewModel.title
        iconView.image = viewModel.image
    }
    
}
