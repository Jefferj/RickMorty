//
//  Extensions.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 18/01/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
