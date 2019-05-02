//
//  UIColor.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/2.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
    self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
  }
}
