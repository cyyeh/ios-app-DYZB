//
//  HomeViewController.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/2.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

private let kTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
  // MARK:- lazy load properties
  private lazy var pageTitleView: PageTitleView = {
    let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
    let titles = ["推薦", "遊戲", "娛樂", "趣玩"]
    let titleView = PageTitleView(frame: titleFrame, titles: titles)
    return titleView
  }()
  
  // MARK:- system callback
  override func viewDidLoad() {
    super.viewDidLoad()

    // setup UI view
    setupUI()
  }

}

// MARK:- setup UI view
extension HomeViewController {
  private func setupUI() {
    // 0. disable auto adjusting scrollview insets
    automaticallyAdjustsScrollViewInsets = false
    
    // 1. setup navigation bar
    setupNavigationBar()
    
    // 2. setup title view
    view.addSubview(pageTitleView)
  }
  
  private func setupNavigationBar() {
    // 1. setup left item
    navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
    
    // 2. setup right items
    let size = CGSize(width: 40, height: 40)
    let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
    let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
    let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
    
    navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
  }
}
