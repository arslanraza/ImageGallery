//
//  Picture+Image.swift
//  ImageGallery
//
//  Created by Arslan Raza on 14/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import SparkImageGalleryCore
import SparkImageNetwork

extension Picture {
  var image: UIImage? {
    return UIImage(named: url) ?? UIImage(contentsOfFile: URL.inDocumentsFolder(fileName: url).path)
  }
}
