//
//  GalleryViewModel.swift
//  ImageGallery
//
//  Created by Arslan Raza on 8/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import SparkImageGalleryCore
import SparkImageNetwork

class GalleryViewModel {
  
  // MARK: Custom Callbacks
  typealias PicturesCallBack = ([Picture], Error?) -> Void
  
  // MARK: Properties
  var pictures: [Picture] = []
  let picturesAPI = PicturesAPIClient()
  
  var picturesDidFinishLoading: PicturesCallBack?
  
  // MARK: Public Methods
  
  func getPictures(for feedType: PicturesFeed) {
    picturesAPI.getFeed(from: feedType) { [weak self] result in
      guard let strongSelf = self else { return }
      switch result {
      case .success(let picturesResult):
        strongSelf.pictures = picturesResult?.pictures ?? []
        strongSelf.picturesDidFinishLoading?(strongSelf.pictures, nil)
      case .failure(let error):
        strongSelf.picturesDidFinishLoading?([], error)
      }
    }
  }
  
}
