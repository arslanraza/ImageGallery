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
  func uploadImage(_ image: UIImage , completion: @escaping (APIError?) -> Void)
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
    
    let endpoint = picturesFeedType
    var request = endpoint.request
    request.httpMethod = "get"
    
    fetch(with: request, decode: { json -> SparkPicturesResult? in
      guard let picturesFeedResult = json as? SparkPicturesResult else {
        return  nil
      }
      return picturesFeedResult
    }, completion: completion)
  }
  
  func uploadImage(_ image: UIImage, completion: @escaping (APIError?) -> Void) {
    let endpoint = PicturesFeed.pictures
    var request = endpoint.request
    request.httpMethod = "post"
    
    let imageData = UIImageJPEGRepresentation(image, 1)
    
    upload(with: request, data: imageData!, completion: completion)
  }
}

public struct PictureResponse: Codable {
  let status: String
}

