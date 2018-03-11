//
//  ImageGalleryViewController.swift
//  ImageGallery
//
//  Created by Arslan Raza on 6/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import UIKit
import SparkImageGalleryCore
import SparkImageNetwork
import Hero

class ImageGalleryViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  fileprivate enum SegueIdentifier: String {
    case imageDetail
  }
  
  fileprivate let viewModel = GalleryViewModel()
  fileprivate var selectedPicture: Picture?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Gallery"
    collectionView.register(PictureCollectionViewCell.nib, forCellWithReuseIdentifier: PictureCollectionViewCell.reuseIdentifier)
    
    // Setting up observer
    viewModel.picturesDidFinishLoading = { [weak self] pictures, error in
      guard let strongSelf = self,
        error == nil else {
        print("Error occured to retrive pictures")
        return
      }
      strongSelf.collectionView.reloadData()
    }
    
    viewModel.shouldOpenImageDetail = { [weak self] picture in
      guard let strongSelf = self else { return }
      strongSelf.selectedPicture = picture
      strongSelf.performSegue(withIdentifier: SegueIdentifier.imageDetail.rawValue, sender: strongSelf)
    }
    
    viewModel.getPictures(for: .all)
  }
  
  // MARK: Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let imageDetailController = segue.destination as? ImageDetailViewController {
      imageDetailController.picture = selectedPicture
    }
  }
  
}

extension ImageGalleryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.pictures.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.reuseIdentifier, for: indexPath) as! PictureCollectionViewCell
    let picture = viewModel.pictures[indexPath.row]
    cell.imageView.hero.id = picture.url
    cell.imageView.image = UIImage(named: picture.url)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width / 4 - 10
    return CGSize(width: width, height: width)
  }
}



extension ImageGalleryViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    viewModel.didSelectPicture(viewModel.pictures[indexPath.row])
  }
}
