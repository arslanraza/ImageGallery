//
//  TabBarController.swift
//  ImageGallery
//
//  Created by Arslan Raza on 6/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension TabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    if viewController.isMember(of: UIViewController.self) {
      print("Open Image Capture")
      return false
    }
    return true
  }
  
}
