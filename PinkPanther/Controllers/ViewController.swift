//
//  ViewController.swift
//  PinkPanther
//
//  Created by Emma Makinson on 19/09/2017.
//  Copyright © 2017 Emma Makinson. All rights reserved.
//

import UIKit
import MDCSwipeToChoose

class ViewController: UIViewController, MDCSwipeToChooseDelegate {
    @IBOutlet weak var containerView: UIView!
    
    var frontCardView: SwipeCollectionView!
    var backCardView: SwipeCollectionView!
    var contentProfile: ContentProfile = ContentProfile.bridget

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        frontCardView = SwipeCollectionView(frame: containerView.bounds, content: contentProfile, delegate: self)
        containerView.addSubview(frontCardView)
        
        changeContentProfile()
        backCardView = SwipeCollectionView(frame: containerView.bounds, content: contentProfile, delegate: self)
        self.containerView.insertSubview(backCardView, belowSubview: frontCardView)
    }
    
    // MARK: MDCSwipeToChooseDelegate Callbacks
    func view(_ view: UIView, wasChosenWith: MDCSwipeDirection) -> Void {
        changeContentProfile()
        
        if (wasChosenWith == .left) {
            print("Photo deleted!")
        } else {
            print("Photo saved!")
        }
        
        frontCardView = backCardView
        backCardView = SwipeCollectionView(frame: containerView.bounds, content: contentProfile, delegate: self)
        containerView.insertSubview(backCardView, belowSubview: frontCardView)
    }
    
    private func changeContentProfile() {
        let isNowBridget = (contentProfile == ContentProfile.bridget)
        contentProfile = isNowBridget ? ContentProfile.tolstoy : ContentProfile.bridget
    }
}
