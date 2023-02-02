//
//  RMSettingsCellViewModel.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 2/02/23.
//

import UIKit

struct RMSettingsCellViewModel {
    private let type: RMSettingsOption
    
    init(type: RMSettingsOption) {
        self.type = type
    }
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
}
