//
//  Image.swift
//  ImageGallery
//
//  Created by Arslan Raza on 11/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import RealmSwift

@objc protocol SomeProperty {
   var myProperty: String { get }
}

class Image: Object, Codable {
  
  @objc dynamic var id = ""
  /// Ref ID of Library Item
  @objc dynamic var url = ""
  /// Title of Library Item
  @objc dynamic var title = ""
  /// Duration of Library Item
  @objc dynamic var imageDescription = ""
  /// Library Item image URL string
  @objc dynamic var dateTaken = Date().timeIntervalSinceReferenceDate
  @objc dynamic var dateUpdated = Date().timeIntervalSinceReferenceDate
  
  // MARK: - Meta
  override static func primaryKey() -> String? {
    return "id"
  }
  
  convenience init(id: String, url: String, title: String, description: String) {
    self.init()
    self.id = id
    self.url = url
    self.title = title
    self.imageDescription = description
  }
  
  enum CodingKeys: String, CodingKey {
    case id
    case url
    case title
    case imageDescription = "description"
    case dateTaken = "dateTaken"
    case dateUpdated = "dateUpdated"
  }
}
