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
import SVProgressHUD

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
      //MARK: change to main queue
      DispatchQueue.main.async {
        SVProgressHUD.dismiss()
        guard let strongSelf = self,
          error == nil else {
            print("Error occured to retrive pictures")
            return
        }
        strongSelf.collectionView.reloadData()
      }
    }
    
    viewModel.shouldOpenImageDetail = { [weak self] picture in
      guard let strongSelf = self else { return }
      strongSelf.selectedPicture = picture
      strongSelf.performSegue(withIdentifier: SegueIdentifier.imageDetail.rawValue, sender: strongSelf)
    }
    
    SVProgressHUD.show()
    Server.configureForInitialData { [weak self] in
      DispatchQueue.main.async {
        self?.refresh()
      }
    }
    
    NotificationCenter.default.addObserver(self, selector: #selector(refresh),
                                           name: NSNotification.Name(rawValue: Notification.imageUploaded.rawValue),
                                           object: nil)    
  }
  
  @objc func refresh() {
    tabBarController?.selectedIndex = 0
    SVProgressHUD.show()
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
  
  private var cellSize: CGSize {
    let width = UIScreen.main.bounds.width / 4 - 10
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.pictures.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.reuseIdentifier, for: indexPath) as! PictureCollectionViewCell
    cell.configure(with: viewModel.pictures[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return cellSize
  }
}

extension ImageGalleryViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    viewModel.didSelectPicture(viewModel.pictures[indexPath.row])
  }
}

