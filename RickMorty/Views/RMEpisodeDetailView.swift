//
//  RMEpisodeDetailView.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 30/01/23.
//

import UIKit

final class RMEpisodeDetailView: UIView {
    private var viewModel: RMEpisodeDetailViewViewModel?
    private var collectionView: UICollectionView?
    private let spinner: UIActivityIndicatorView = {
        let aSpinner = UIActivityIndicatorView()
        aSpinner.translatesAutoresizingMaskIntoConstraints = false 
        return aSpinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        self.collectionView = createdCollectionView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }
    
    private func createdCollectionView() -> UICollectionView {
        
    }
    
    public func configure(with viewModel: RMEpisodeDetailViewViewModel) {
        self.viewModel = viewModel
    }
}
