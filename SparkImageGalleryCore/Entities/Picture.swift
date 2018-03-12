//
//  Picture.swift
//  SparkImageGalleryCore
//
//  Created by Arslan Raza on 7/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation

public struct SparkPicturesResult: Codable {
  public let pictures: [Picture]
  public init(pictures: [Picture]) {
    self.pictures = pictures
  }
}

public struct Picture: Codable {
  
  public let id: String
  public let url: String
  public let title: String
  public let description: String
  public let dateUpdated: Date?
  public let dateTaken: Date?
  
  public init(id: String, url: String, title: String, description: String, dateUpdated: Date, dateTaken: Date) {
    self.id = id
    self.url = url
    self.title = title
    self.description = description
    self.dateUpdated = dateUpdated
    self.dateTaken = dateTaken
  }
}

extension Picture: Equatable {
  public static func ==(lhs: Picture, rhs: Picture) -> Bool {
    return lhs.id == rhs.id
  }
}
