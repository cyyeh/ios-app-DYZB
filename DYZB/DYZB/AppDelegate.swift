//
//  AppDelegate.swift
//  DYZB
//
//  Created by ChihYu Yeh on 2019/5/1.
//  Copyright © 2019 cyyeh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
    UITabBar.appearance().tintColor = UIColor.orange
    
    return true
  }

}

