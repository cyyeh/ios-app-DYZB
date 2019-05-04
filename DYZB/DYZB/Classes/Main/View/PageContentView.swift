//
//  PageContentView.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/2.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {

  //MARK:- properties
  private var childVcs: [UIViewController]
  private weak var parentViewController: UIViewController?
  
  //MARK:- lazy loading properties
  private lazy var collectionView: UICollectionView = { [weak self] in
    // 1. create layout
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = (self?.bounds.size)!
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    
    // 2. create UICollectionView
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    collectionView.bounces = false
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
    
    return collectionView
  }()
  
  // MARK:- self-defined init function
  init(frame: CGRect, childVcs: [UIViewController], parentViewController: UIViewController?) {
    self.childVcs = childVcs
    self.parentViewController = parentViewController
    
    super.init(frame: frame)
    
    // setup UI
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

// MARK:- setup UI view
extension PageContentView {
  private func setupUI() {
    // 1. add child view controllers to parent view controller
    for childVc in childVcs {
      parentViewController?.addChild(childVc)
    }
    
    // 2. add UICollectionView
    addSubview(collectionView)
    collectionView.frame = bounds
  }
}

// MARK:- UICollectionView Data Source Protocol
extension PageContentView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return childVcs.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // 1. create cell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
    
    // 2. setup cell's content
    for view in cell.contentView.subviews {
      view.removeFromSuperview()
    }
    
    let childVc = childVcs[indexPath.item]
    childVc.view.frame = cell.contentView.bounds
    cell.contentView.addSubview(childVc.view)
    
    return cell
  }
}

// MARK:- open method
extension PageContentView {
  func setCurrentIndex(currentIndex: Int) {
    let offsetX = CGFloat(currentIndex) * collectionView.frame.width
    collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
  }
}
