//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/2.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
  /*
  class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
    let btn = UIButton()
    btn.setImage(UIImage(named: imageName), for: .normal)
    btn.setImage(UIImage(named: highImageName), for: .highlighted)
    
    btn.frame = CGRect(origin: .zero, size: size)
    return UIBarButtonItem(customView: btn)
  }
  */
  
  convenience init(imageName: String, highImageName: String = "", size: CGSize = .zero) {
    self.init()
    
    // 1. create button
    let btn = UIButton()
    
    // 2. setup button's image
    btn.setImage(UIImage(named: imageName), for: .normal)
    if highImageName != "" {
      btn.setImage(UIImage(named: highImageName), for: .highlighted)
    }
    
    // 3. setup button's size
    if size == .zero {
      btn.sizeToFit()
    } else {
      btn.frame = CGRect(origin: .zero, size: size)
    }
    
    // 4. initialize UIBarButtonItem
    self.init(customView: btn)
  }
}
