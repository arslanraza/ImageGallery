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
  
  @IBOutlet weak var collectionView: UICollectionView!
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
  
}

extension ImageGalleryViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
}

extension ImageGalleryViewController: UICollectionViewDelegate {
  
}
