//
//  SummaryCollectionViewCell.swift
//  PinkPanther
//
//  Created by Emma Makinson on 20/09/2017.
//  Copyright © 2017 Emma Makinson. All rights reserved.
//

import UIKit

protocol ContentProfileConfigurable {
    func configure(_ profile: ContentProfile)
}

class SummaryCollectionViewCell: UICollectionViewCell, ContentProfileConfigurable {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var loveButton: UIButton!
    @IBOutlet private weak var iconView: UIImageView!
    
    func configure(_ profile: ContentProfile) {
        let templateImage = UIImage(named: "heart_icon")?.withRenderingMode(.alwaysTemplate)
        loveButton.setImage(templateImage, for: .normal)
        loveButton.tintColor = .red
        
        // TODO: Extract some of this conversion logic to view model
        imageView.image = UIImage(named: profile.imageName)
        
        let descriptionTags = profile.keywords.map { "#" + $0 }
        descriptionLabel.text = descriptionTags.joined(separator: " ")
        descriptionLabel.font = UIFont(name: "Lato-Regular", size: 18)
        
        iconView.image = UIImage(named: profile.type.iconName)
    }
}
