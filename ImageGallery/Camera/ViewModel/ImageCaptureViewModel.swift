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
  
  func upload(_ image: UIImage, completion: @escaping (APIError?) -> Void) {
    picturesAPI.uploadImage(image, completion: completion)
  }
  
}
