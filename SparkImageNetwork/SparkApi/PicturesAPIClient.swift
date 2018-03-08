//
//  PicturesAPIClient.swift
//  SparkImageNetwork
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import SparkImageGalleryCore

public class PicturesAPIClient: APIClient {
  
  let session: URLSessionProtocol
  
  public init(configuration: URLSessionConfiguration) {
    self.session = URLSession(configuration: configuration)
  }
  
  convenience public init() {
    self.init(configuration: .default)
  }
  
  public func getFeed(from picturesFeedType: PicturesFeed, completion: @escaping (Result<SparkPicturesResult?, APIError>) -> Void) {
    
    completion(Result.success(generateMockPictures()))
    
//    let endpoint = picturesFeedType
//    let request = endpoint.request
//
//    fetch(with: request, decode: { json -> SparkPicturesResult? in
//      guard let picturesFeedResult = json as? SparkPicturesResult else {
//        return  nil
//      }
//      return picturesFeedResult
//    }, completion: completion)
  }
}

extension PicturesAPIClient {
  fileprivate func generateMockPictures() -> SparkPicturesResult {
    var pictures: [Picture] = []
    for i in 1...14 {
      let picture = Picture(id: "id_\(i)", url: "image_\(i).jpg", title: "Vacation", description: "", dateUpdated: "12312312", dateTaken: "1234231231")
      pictures.append(picture)
    }
    return SparkPicturesResult(pictures: pictures)
  }
}

