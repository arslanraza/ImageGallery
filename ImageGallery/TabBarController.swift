//
//  TabBarController.swift
//  ImageGallery
//
//  Created by Arslan Raza on 6/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import CropViewController
import ImagePicker

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }
  
  // MARK: Private Methods
  fileprivate func openCamera() {
    let imagePicker = ImageCaptureViewController()
    let navigationController = UINavigationController.init(rootViewController: imagePicker)
    self.present(navigationController, animated: true, completion: nil)
  }
  
}

extension TabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    if viewController.isMember(of: UIViewController.self) {
      openCamera()
      return false
    }
    return true
  }
}
