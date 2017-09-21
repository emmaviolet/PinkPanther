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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        frontCardView = SwipeCollectionView(frame: containerView.bounds, delegate: self)
        containerView.addSubview(frontCardView)
        
        backCardView = SwipeCollectionView(frame: containerView.frame, delegate: self)
        self.view.insertSubview(backCardView, belowSubview: frontCardView)
    }
    
    // MARK: MDCSwipeToChooseDelegate Callbacks
    func view(_ view: UIView, wasChosenWith: MDCSwipeDirection) -> Void{
        if (wasChosenWith == .left) {
            print("Photo deleted!")
        } else {
            print("Photo saved!")
        }
        
        frontCardView = backCardView
        backCardView = SwipeCollectionView(frame: containerView.frame, delegate: self)
        self.view.insertSubview(backCardView, belowSubview: frontCardView)
    }
}
