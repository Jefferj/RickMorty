//
//  RMCharacterInfoCollectionViewCell.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 26/01/23.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    private let valueLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = .systemFont(ofSize: 22, weight: .light)
        return aLabel
    }()
    
    private let titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textAlignment = .center
        aLabel.font = .systemFont(ofSize: 20, weight: .medium)
        return aLabel
    }()
    
    private let iconImageView: UIImageView = {
        let aIcon = UIImageView()
        aIcon.translatesAutoresizingMaskIntoConstraints = false
        aIcon.contentMode = .scaleAspectFit
        return aIcon
    }()
    
    private let titleContainerView: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.backgroundColor = .secondarySystemBackground
        return aView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(titleContainerView, valueLabel, iconImageView)
        titleContainerView.addSubviews(titleLabel)
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            titleLabel.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            
            valueLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
            valueLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        titleLabel.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = .label
        titleLabel.textColor = .label
    }
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.displayValue
        iconImageView.image = viewModel.iconImage
        iconImageView.tintColor = viewModel.tintColor
        titleLabel.textColor = viewModel.tintColor
    }
}
