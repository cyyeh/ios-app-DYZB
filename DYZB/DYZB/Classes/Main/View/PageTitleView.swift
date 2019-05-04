//
//  PageTitleView.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/2.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate: class {
  func pageTitleView(titleView: PageTitleView, selectedIndex index: Int)
}

private let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {
  
  // MARK:- properties
  private  var currentIndex = 0
  private var titles: [String]
  weak var delegate: PageTitleViewDelegate?
  
  // MARK:- load lazy properties
  private lazy var titleLabels = [UILabel]()
  
  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.scrollsToTop = false
    scrollView.bounces = false
    
    return scrollView
  }()
  
  private lazy var scrollLine: UIView = {
    let scrollLine = UIView()
    scrollLine.backgroundColor = UIColor.orange
    return scrollLine
  }()
  
  // MARK:- self-defined init function
  init(frame: CGRect, titles: [String]) {
    self.titles = titles
    
    super.init(frame: frame)
    
    // setup UI view
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK:- setup UI view
extension PageTitleView {
  private func setupUI() {
    // 1. add UIScrollView
    addSubview(scrollView)
    scrollView.frame = bounds
    
    // 2. add labels for titles
    setupTitleLabels()
    
    // 3. setup bottom line and scroll line
    setupBottomLineAndScrollLine()
  }
  
  private func setupTitleLabels() {
    // 0. setup label's common properties
    let labelW: CGFloat = frame.width / CGFloat(titles.count)
    let labelH: CGFloat = frame.height - kScrollLineH
    let labelY: CGFloat = 0
    
    for (index, title) in titles.enumerated() {
      // 1. create UILabel
      let label = UILabel()
      
      // 2. setup label's properties
      label.text = title
      label.tag = index
      label.font = UIFont.systemFont(ofSize: 16.0)
      if index == 0 {
        label.textColor = UIColor.orange
      } else {
        label.textColor = UIColor.darkGray
      }
      label.textAlignment = .center
      
      // 3. setup label's frame
      let labelX: CGFloat = labelW * CGFloat(index)
      label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
      
      // 4. add label into scrollView
      scrollView.addSubview(label)
      titleLabels.append(label)
      
      // 5. add gesture to label
      label.isUserInteractionEnabled = true
      let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
      label.addGestureRecognizer(tapGes)
    }
  }
  
  private func setupBottomLineAndScrollLine() {
    // 1. add bottom line
    let bottomLine = UIView()
    bottomLine.backgroundColor = UIColor.lightGray
    let lineH: CGFloat = 0.5
    bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
    addSubview(bottomLine)
    
    // 2. add scroll line
    // 2.1 get first label
    guard let firstLabel = titleLabels.first else { return }
    
    // 2.2 setup scrollLine properties
    scrollView.addSubview(scrollLine)
    scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
  }
}

// MARK:- listening to label's click event
extension PageTitleView {
  @objc private func titleLabelClick(tapGes: UITapGestureRecognizer) {
    // 1. get current label
    guard let currentLabel = tapGes.view as? UILabel else { return }
    
    // 2. get last label
    let oldLabel = titleLabels[currentIndex]
    
    // 3. switch text color
    currentLabel.textColor = UIColor.orange
    oldLabel.textColor = UIColor.darkGray
    
    // 4. save new label index
    currentIndex = currentLabel.tag
    
    // 5. scroll line position changed
    let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
    UIView.animate(withDuration: 0.15) {
      self.scrollLine.frame.origin.x = scrollLineX
    }
    
    // 6. delegate
    delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
  }
}
