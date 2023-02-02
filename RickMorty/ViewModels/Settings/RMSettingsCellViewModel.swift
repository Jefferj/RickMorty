//
//  RMSettingsCellViewModel.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 2/02/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable{
    let id = UUID()
    public let type: RMSettingsOption
    public let onTapHandler: (RMSettingsOption) -> Void
    
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
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
