//
//  ImageDetailViewController.swift
//  ImageGallery
//
//  Created by Arslan Raza on 11/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import SparkImageGalleryCore

class ImageDetailViewController: UIViewController {
  
  var picture: Picture?
  
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.hero.navigationAnimationType = .fade
    precondition(picture != nil, "Picture should never be nil")
    
    imageView.hero.id = picture?.url
    imageView.image = picture?.image
  }
  
}
