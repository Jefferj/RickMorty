//
//  RMEpisodeInfoCollectionViewCell.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 1/02/23.
//

import UIKit

final class RMEpisodeInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMEpisodeInfoCollectionViewCell"
    
    private let titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 20, weight: .medium)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        return aLabel
    }()
    
    private let valueLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.font = .systemFont(ofSize: 20, weight: .regular)
        aLabel.textAlignment = .right
        aLabel.numberOfLines = 0
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        return aLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(titleLabel, valueLabel)
        setUpLayer()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpLayer(){
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.47),
            valueLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.47)
        ])
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        valueLabel.text = nil
    }
    
    func configure(with viewModel: RMEpisodeInfoCollectionViewCellViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
    }
}
