//
//  NavigationController.swift
//  ImageGallery
//
//  Created by Arslan Raza on 14/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
  
    override var shouldAutorotate: Bool {
      return true
    }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
    return .portrait
  }
  
}
