//
//  RMEpisodeDetailView.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 30/01/23.
//

import UIKit

final class RMEpisodeDetailView: UIView {
    private var viewModel: RMEpisodeDetailViewViewModel?{
        didSet{
            spinner.stopAnimating()
            self.collectionView?.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.collectionView?.alpha = 1
            }
        }
    }
    
    private var collectionView: UICollectionView?
    
    private let spinner: UIActivityIndicatorView = {
        let aSpinner = UIActivityIndicatorView()
        aSpinner.translatesAutoresizingMaskIntoConstraints = false
        aSpinner.hidesWhenStopped = true
        return aSpinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        let collectionView = createdCollectionView()
        addSubviews(collectionView, spinner)
        self.collectionView = collectionView
        addConstraints()
        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func createdCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            return self.layout(for: section)
        }
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RMEpisodeInfoCollectionViewCell.self, forCellWithReuseIdentifier: RMEpisodeInfoCollectionViewCell.cellIdentifier)
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        return collectionView
    }
    
    public func configure(with viewModel: RMEpisodeDetailViewViewModel) {
        self.viewModel = viewModel
    }
}

extension RMEpisodeDetailView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sections = viewModel?.cellViewModels else {
            return 0
        }
        let sectionType = sections[section]
        switch sectionType {
        case .information(let viewModels):
            return viewModels.count
        case .characters(let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sections = viewModel?.cellViewModels else {
            fatalError("No viewModel")
        }
        let sectionType = sections[section]
        switch sectionType {
        case .information(let viewModels):
            let cellViewModel = viewModels[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMEpisodeInfoCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? RMEpisodeInfoCollectionViewCell else {
                fatalError()
            }
        case .characters(let viewModels):
            let cellViewModel = viewModels[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? RMCharacterCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: cellViewModel)
            return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension RMEpisodeDetailView {
    func layout(for section: Int) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100)),
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
