//
//  Picture.swift
//  SparkImageGalleryCore
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation

public struct SparkPicturesResult: Codable {
  public let picturs: [Picture]
}

public struct Picture: Codable {
  
  public let id: String
  public let url: String
  public let title: String
  public let description: String
  public let dateUpdated: String
  public let dateTaken: String
  
}

extension Picture: Equatable {
  public static func ==(lhs: Picture, rhs: Picture) -> Bool {
    return lhs.id == rhs.id
  }
}
