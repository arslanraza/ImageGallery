//
//  PictureCollectionViewCell+Configuration.swift
//  ImageGallery
//
//  Created by Arslan Raza on 14/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import SparkImageGalleryCore

extension PictureCollectionViewCell {
  
  func configure(with picture: Picture) {
    imageView.hero.id = picture.url
    imageView.image = picture.image
  }
}
