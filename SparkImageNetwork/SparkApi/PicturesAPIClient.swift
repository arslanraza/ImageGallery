//
//  PicturesAPIClient.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import SparkImageGalleryCore

protocol PicturesService {
  func getFeed(from picturesFeedType: PicturesFeed, completion: @escaping (Result<SparkPicturesResult?, APIError>) -> Void)
}

public class PicturesAPIClient: APIClient, PicturesService {
  
  let session: URLSessionProtocol
  
  public init(configuration: URLSessionConfiguration) {
    self.session = Server() //URLSession(configuration: configuration)
  }
  
  convenience public init() {
    self.init(configuration: .default)
  }
  
  public func getFeed(from picturesFeedType: PicturesFeed, completion: @escaping (Result<SparkPicturesResult?, APIError>) -> Void) {
    
    //    completion(Result.success(SparkPicturesResult.generateMockPictures()))
    
    let endpoint = picturesFeedType
    let request = endpoint.request
    
    fetch(with: request, decode: { json -> SparkPicturesResult? in
      guard let picturesFeedResult = json as? SparkPicturesResult else {
        return  nil
      }
      return picturesFeedResult
    }, completion: completion)
  }
}

extension SparkPicturesResult {
  static func generateMockPictures() -> SparkPicturesResult {
    var pictures: [Picture] = []
    for i in 1...14 {
      let picture = Picture(id: "id_\(i)", url: "image_\(i).jpg", title: "Vacation", description: "", dateUpdated: Date(), dateTaken: Date())
      pictures.append(picture)
    }
    return SparkPicturesResult(pictures: pictures)
  }
}

