//
//  HomeViewController.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/2.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // setup UI view
    setupUI()
  }

}

// MARK:- setup UI view
extension HomeViewController {
  private func setupUI() {
    // 1. setup navigation bar
    setupNavigationBar()
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
