//
//  SwipeCollectionView.swift
//  PinkPanther
//
//  Created by Emma Makinson on 20/09/2017.
//  Copyright © 2017 Emma Makinson. All rights reserved.
//

import Foundation
import MDCSwipeToChoose
import CHIPageControl

enum SwipeCollectionCellType {
    case summary, detail
    
    var nibName: String {
        switch self {
        case .summary:
            return "SummaryCollectionViewCell"
        case .detail:
            return "DetailCollectionViewCell"
        }
    }
}

class SwipeCollectionView: MDCSwipeToChooseView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var content: ContentProfile
    private let options: MDCSwipeToChooseViewOptions = {
        let options = MDCSwipeToChooseViewOptions()
        options.likedText = nil
        options.nopeText = nil
        options.likedColor = .clear
        options.nopeColor = .clear
        return options
    }()
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let pageControl: CHIPageControlChimayo = {
        let pageControl = CHIPageControlChimayo(frame: CGRect(x: 0, y:0, width: 100, height: 50))
        pageControl.radius = 6
        pageControl.tintColor = .white
        pageControl.currentPageTintColor = .white
        
        let oneEighty = CGFloat(Double.pi / 2)
        pageControl.transform = CGAffineTransform(rotationAngle: oneEighty)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    private let cells: [SwipeCollectionCellType] = [.summary, .detail]
    
    init(frame: CGRect, content: ContentProfile, delegate: MDCSwipeToChooseDelegate) {
        self.content = content
        options.delegate = delegate
        super.init(frame: frame, options: options)
        self.layer.cornerRadius = 20
        
        collectionView.frame = self.bounds
        collectionView.dataSource = self
        collectionView.delegate = self
        self.addSubview(collectionView)
        
        self.addPageControl()
        self.registerCells()
    }
    
    private func addPageControl() {
        pageControl.numberOfPages = cells.count
        self.addSubview(pageControl)
        
        let rightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: pageControl,
            attribute: .trailing,
            multiplier: 1,
            constant: 17
        )
        
        let centerYConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: pageControl,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )
        self.addConstraints([rightConstraint, centerYConstraint])
    }
    
    private func registerCells() {
        cells.forEach { cell in
            let nib = UINib(nibName: cell.nibName, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: cell.nibName)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = cells[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.nibName, for: indexPath)
        
        if let cell = cell as? ContentProfileConfigurable {
            cell.configure(content)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int ) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        pageControl.set(progress: indexPath.row, animated: true)
    }
}
