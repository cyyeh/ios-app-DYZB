//
//  MainViewController.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/2.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let storyBoardNames = ["Home", "Live", "Follow", "Profile"]
    for storyBoardName in storyBoardNames {
      addChildVc(storyBoardName)
    }
  }

  private func addChildVc(_ storyName: String) {
    // 1. acquire view controllers from storyboard
    let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()! // bundle: nil -> default: main bundle
    /// 2. make childVc as child view controller
    addChild(childVc)
  }
}
