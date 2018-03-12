//
//  RealmConfig.swift
//  ImageGallery
//
//  Created by Arslan Raza on 11/3/18.
//  Copyright © 2018 arkTechs. All rights reserved.
//

import Foundation
import RealmSwift

/// Configuration for Realm Database
/// We can have multiple configuration for multiple databases in future
enum RealmConfig {
  
  // MARK: - private configurations
  private static let mainConfig = Realm.Configuration(
    fileURL: NSURL.inDocumentsFolder(fileName: "main.realm"),
    schemaVersion: 1,
    objectTypes: [Image.self]
  )
  
  // MARK: - enum cases
  case main
  
  // MARK: - current configuration
  var configuration: Realm.Configuration {
    switch self {
    case .main:
      return RealmConfig.mainConfig
    }
  }
  
}


extension NSURL {
  // returns an absolute URL to the desired file in documents folder
  class func inDocumentsFolder(fileName: String) -> URL {
    return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
      .appendingPathComponent(fileName)
  }
}
