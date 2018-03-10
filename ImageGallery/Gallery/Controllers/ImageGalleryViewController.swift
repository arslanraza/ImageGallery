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
  
  fileprivate let viewModel = GalleryViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(PictureCollectionViewCell.nib, forCellWithReuseIdentifier: PictureCollectionViewCell.reuseIdentifier)
    
    // Setting up observer
    viewModel.picturesDidFinishLoading = { [weak self] pictures, error in
      guard let strongSelf = self,
        let _ = error else {
        print("Error occured to retrive pictures")
        return
      }
      strongSelf.collectionView.reloadData()
    }
    
    viewModel.getPictures(for: .all)
  }
  
}

extension ImageGalleryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.pictures.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.reuseIdentifier, for: indexPath) as! PictureCollectionViewCell
    let picture = viewModel.pictures[indexPath.row]
    cell.imageView.image = UIImage(named: picture.url)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width / 4 - 10
    return CGSize(width: width, height: width)
  }
}



extension ImageGalleryViewController: UICollectionViewDelegate {
  
}
