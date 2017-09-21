//
//  DetailCollectionViewCell.swift
//  PinkPanther
//
//  Created by Emma Makinson on 20/09/2017.
//  Copyright © 2017 Emma Makinson. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell, ContentProfileConfigurable {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var blurbLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    func configure(_ profile: ContentProfile) {
        let templateImage = UIImage(named: "heart_icon")?.withRenderingMode(.alwaysTemplate)
        loveButton.setImage(templateImage, for: .normal)
        loveButton.tintColor = .red
        
        iconView.image = UIImage(named: profile.type.iconName)
        
        titleLabel.text = profile.title
        blurbLabel.text = profile.blurb
        
        titleLabel.font = UIFont(name: "Lato-Semibold", size: 25)
        blurbLabel.font = UIFont(name: "Lato-Regular", size: 18)
        buyButton.setTitle("Buy", for: .normal)
    }
}
