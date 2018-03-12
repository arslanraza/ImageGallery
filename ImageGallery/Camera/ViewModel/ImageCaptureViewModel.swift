//
//  ImageCaptureViewModel.swift
//  ImageGallery
//
//  Created by Arslan Raza on 12/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import SparkImageGalleryCore
import SparkImageNetwork

class ImageCaptureViewModel {
  
  // MARK: Custom Callbacks
  typealias PictureUploadCallBack = (Error?) -> Void
  
  // MARK: Properties
  let picturesAPI = PicturesAPIClient()
  
  var pictureDidFinishedUploading: PictureUploadCallBack?
  
  // MARK: Public Methods
  
  func uploadPicture(for feedType: PicturesFeed) {
    picturesAPI.getFeed(from: feedType) { [weak self] result in
      guard let strongSelf = self else { return }
      switch result {
      case .success(let picturesResult):
//        strongSelf.picturesDidFinishLoading?(strongSelf.pictures, nil)
        break
      case .failure(let error):
//        strongSelf.picturesDidFinishLoading?([], error)
        break
      }
    }
  }
  
  func didSelectPicture(_ picture: Picture) {
    
  }
  
}
