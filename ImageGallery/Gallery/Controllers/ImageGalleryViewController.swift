//
//  ImageGalleryViewController.swift
//  ImageGallery
//
//  Created by Arslan Raza on 6/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import SparkImageNetwork

class ImageGalleryViewController: UIViewController {
  
  let picturesAPI = PicturesAPIClient()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    picturesAPI.getFeed(from: .all) { result in
      switch result {
      case .success(let picturesResult):
        print("Pictures: \(picturesResult!.pictures)")
      case .failure(let error):
        print("Error: \(error)")
      }
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
