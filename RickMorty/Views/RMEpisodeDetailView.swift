//
//  RMEpisodeDetailView.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 30/01/23.
//

import UIKit

final class RMEpisodeDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
