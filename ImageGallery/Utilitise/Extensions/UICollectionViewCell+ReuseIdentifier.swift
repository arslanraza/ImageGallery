//
//  UICollectionViewCell+ReuseIdentifier.swift
//  ImageGallery
//
//  Created by Arslan Raza on 9/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
